import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../models/notficiation_model.dart';
import 'local_notfiication_service.dart';

class PushNotificationService {
  static String? fcmToken;
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await _messaging.requestPermission();
    //! there is an exception thrown from here
    try {
      fcmToken = await _messaging.getToken();
      log(fcmToken!);
    } on Exception catch (e) {
      log(e.toString());
    }
    onBackGroundMessage();
    onForegroundMessage();
    _messaging.subscribeToTopic("AllUsers");
  }

  static Future<void> onBackGroundMessage() async {
    FirebaseMessaging.onBackgroundMessage(_handler);
  }

  static onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(onData);
  }

  static onData(RemoteMessage message) async {
    LocalNotificationService.showBasicNotification(
      notificationModel: NotificationModel(
        id: message.messageId.hashCode,
        title: message.notification?.title.toString() ?? "null",
        body: message.notification?.body.toString() ?? "null",
        payload: message.data.toString(),
      ),
    );
    log(message.messageId.hashCode.toString());
  }

  static Future<void> _handler(RemoteMessage message) async {
    // log(message.notification?.title.toString() ?? "null");
  }
}
