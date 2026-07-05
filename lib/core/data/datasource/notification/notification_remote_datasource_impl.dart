import 'package:buzzwire/core/common/extension/string_extension.dart';
import 'package:buzzwire/core/data/datasource/notification/notification_remote_datasource.dart';
import 'package:buzzwire/core/data/model/topic_model.dart';
import 'package:buzzwire/core/constants/firebase_collection_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationRemoteDatasource)
class NotificationRemoteDatasourceImpl implements NotificationRemoteDatasource {
  final FirebaseMessaging messaging;
  final FirebaseFirestore firestore;

  NotificationRemoteDatasourceImpl({
    required this.messaging,
    required this.firestore,
  });

  CollectionReference<Map<String, dynamic>> get _deviceTokenCollectionRef =>
      firestore.collection(FirebaseCollectionConstants.deviceTokenCollection);

  CollectionReference<Map<String, dynamic>> get _topicsCollectionRef =>
      firestore.collection(FirebaseCollectionConstants.topicsCollection);

  @override
  Future<void> saveDeviceToken(String userId) async {
    final deviceToken = await messaging.getToken();
    await _removeDuplicatesIfExists(deviceToken.orEmpty);

    // saves the device token
    await _deviceTokenCollectionRef.doc(userId).set({
      "tokens": FieldValue.arrayUnion([deviceToken]),
    });
  }

  @override
  Future<void> deleteUserDeviceTokens(String userId) async {
    await messaging.deleteToken();
    await _deviceTokenCollectionRef.doc(userId).delete();
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
  }

  Future<void> _removeDuplicatesIfExists(String deviceToken) async {
    final usersWithDeviceToken = await _deviceTokenCollectionRef
        .where("tokens", arrayContains: deviceToken)
        .get();

    if (usersWithDeviceToken.docs.isNotEmpty) {
      // Device token exists for another user
      final previousUserId = usersWithDeviceToken.docs.first.id;

      // remove device token from the previous user's list of device token
      await _deviceTokenCollectionRef.doc(previousUserId).update({
        "tokens": FieldValue.arrayRemove([deviceToken]),
      });
    }
  }

  @override
  Future<void> deleteToken(String userId) async {
    final deviceToken = await messaging.getToken();
    await messaging.deleteToken();
    await _deviceTokenCollectionRef.doc(userId).update({
      "tokens": FieldValue.arrayRemove([deviceToken]),
    });
  }

  @override
  Future<List<TopicModel>> getTopics() async {
    final topicsCollectionSnap = await _topicsCollectionRef
        .withConverter(
          fromFirestore: TopicModel.fromFirestore,
          toFirestore: (topicModel, options) => topicModel.toFirestore(),
        )
        .get(const GetOptions(source: Source.server));

    final topics =
        topicsCollectionSnap.docs.map((doc) => doc.data()).toList();
    return topics;
  }
}
