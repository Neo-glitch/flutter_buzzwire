import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BuzzWireMessagingService {
  /// FCM Message instance
  static final _messaging = FirebaseMessaging.instance;

  /// flutter local notification instance
  static final _flutterLocalNotication = FlutterLocalNotificationsPlugin();

  /// android notification channel, channel id is same as what's in android manifest
  static const _androidNotificationChannel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  /// IOS notification channel
  static const _iOSNotificationChannel = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  /// FCM Token to send to server
  static String? _token;

  static Future<void> init() async {
    _requestPermission();
    _getFCMToken();
    _configureLocalNotificationPlugin();
    _createAndroidNotificationChannel();

    // gets message that caused app to start from terminated state
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Foreground notification handler (when push notification received when app in foreground)
    FirebaseMessaging.onMessage.listen(_showForegroundNotification);

    // for notification click when app in background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  /// for Android 13 and IOS, permission is required
  static void _requestPermission() async {
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

  /// Fetches FCM token and update [_token] field and also make call to cloud firestore to persist
  static void _getFCMToken() async {
    _token = await _messaging.getToken();
    await _messaging.unsubscribeFromTopic("Sports");

    // get update toten values and
    _messaging.onTokenRefresh.listen((newToken) {
      _token = newToken;
    });

    BuzzWireLoggerHelper.debug("Device Token is: $_token");
  }

  static void _configureLocalNotificationPlugin() async {
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
  static void _createAndroidNotificationChannel() async {
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
      payload: message.data.toString(),
    );
  }

  static void _handleMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    BuzzWireLoggerHelper.debug(
        "Notification handled with: ${notification.toString()}");
  }

  static void _onForegroundNotificationTap(NotificationResponse response) {
    if (response.payload == null) return;

    // get payload and creat
    BuzzWireLoggerHelper.debug("Payload from foregound: ${response.payload}");
  }
}
