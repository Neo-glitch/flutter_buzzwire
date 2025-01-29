import 'dart:convert';

import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/navigation/app_router.dart';
import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/data/mapper/article_mapper.dart';
import 'package:buzzwire/src/features/news/data/model/article_model.dart';
import 'package:buzzwire/src/features/notification/data/model/notification_type.dart';
import 'package:buzzwire/src/features/notification/domain/repository/notification_repository.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

class BuzzWireMessagingService {
  static String? _deviceToken;
  static final _messaging = FirebaseMessaging.instance;
  static final _flutterLocalNotication = FlutterLocalNotificationsPlugin();
  static final NotificationRepository _notificationRepository = injector();
  static final ProfileRepository _profileRepository = injector();

  static const _androidNotificationChannel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  static const _iOSNotificationChannel = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  static Future<void> init() async {
    await _requestPermission();
    await _getFCMToken();
    await _configureLocalNotificationPlugin();
    await _createAndroidNotificationChannel();
    await getInitialMessage();
    _subscribeToSystemAlertTopic();
    // Foreground notification handler (when push notification received when app in foreground)
    FirebaseMessaging.onMessage.listen(_showForegroundNotification);
    // for notification click when app in background
    FirebaseMessaging.onMessageOpenedApp
        .listen((remoteMessage) => _handleMessageData(remoteMessage.data));
  }

  static Future<void> getInitialMessage() async {
    // gets message that caused app to start from terminated state
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    BuzzWireLoggerHelper.debug(
        "Notification Initital message is: ${initialMessage.toString()}");

    if (initialMessage != null) {
      _handleMessageData(initialMessage.data);
    }
  }

  static void _subscribeToSystemAlertTopic() {
    _notificationRepository.subscribeToTopic("SystemAlert");
  }

  static Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // User has granted the notification permission
      BuzzWireLoggerHelper.debug("Notification Permission fully granted");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // User has only granted the provisional permission
      BuzzWireLoggerHelper.debug(
          "Notification Permission provisionally granted");
    } else {
      // User has discarded the permission popup or denied the notification permission
      BuzzWireLoggerHelper.debug("Notification Permission denied");
    }
  }

  static Future<void> _getFCMToken() async {
    _deviceToken = await _messaging.getToken();
    await _messaging.unsubscribeFromTopic("Sports");

    // get update toten values and
    _messaging.onTokenRefresh.listen((newToken) {
      _deviceToken = newToken;
    });

    BuzzWireLoggerHelper.debug("Device Token is: $_deviceToken");
  }

  static Future<void> _configureLocalNotificationPlugin() async {
    const androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInitSettings = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const initSettings = InitializationSettings(
        android: androidInitSettings, iOS: iosInitSettings);

    // init flutter local notificaton with settings for android and ios
    await _flutterLocalNotication.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onForegroundNotificationTap,
    );

    // update IOS foreground notification persentation options to allow heads up notifications
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// create android notification channel with id same as id in android manifest
  static Future<void> _createAndroidNotificationChannel() async {
    await _flutterLocalNotication
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidNotificationChannel);
  }

  static void _showForegroundNotification(RemoteMessage message) async {
    final notification = message.notification;

    if (notification == null) return;

    // to customize the android notification
    final androidNotificationDetails = AndroidNotificationDetails(
      _androidNotificationChannel.id,
      _androidNotificationChannel.name,
      channelDescription: _androidNotificationChannel.description,
      importance: Importance.max,
      priority: Priority.high,
      icon: "@drawable/notification_icon",
      color: BuzzWireColors.primary,
    );

    await _flutterLocalNotication.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: androidNotificationDetails,
        iOS: _iOSNotificationChannel,
      ),
      payload: jsonEncode(message.data),
    );
  }

  static void _handleMessageData(
    Map<String, dynamic>? remoteMessageData,
  ) async {
    if (remoteMessageData != null &&
        NotificationType.fromJsonName(remoteMessageData["type"]) != null) {
      final notificationType =
          NotificationType.fromJsonName(remoteMessageData["type"]);

      if (notificationType == NotificationType.newArticle &&
          _getUser() != null) {
        final Map<String, dynamic> articleJson =
            jsonDecode(remoteMessageData["article"]);
        final article =
            ArticleMapper.fromArticleModel(ArticleModel.fromJson(articleJson));

        // navigate to article screen
        final context = rootNavigatorKey.currentContext;
        if (context != null) {
          // Navigate to the details screen
          WidgetsBinding.instance.addPostFrameCallback((duration) {
            GoRouter.of(context)
                .pushNamed(BuzzWireRoute.newsDetailScreen.name, extra: article);
          });
        }
      }
    }
  }

  static UserEntity? _getUser() {
    return _profileRepository.getCachedUser().getOrElse((l) => null);
  }

  static void _onForegroundNotificationTap(NotificationResponse response) {
    if (response.payload != null) {
      _handleMessageData(jsonDecode(response.payload!));
    }
  }

  static String? get deviceToken => _deviceToken;
}
