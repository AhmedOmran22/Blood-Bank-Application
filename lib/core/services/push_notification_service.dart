import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../models/notficiation_model.dart';
import 'local_notfiication_service.dart';

class PushNotificationService {
  static String? fcmToken;
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await _messaging.requestPermission();

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print("No internet connection. Skipping FCM token request.");
      listenForInternet();
      return;
    }

    await fetchFcmToken();
    onBackGroundMessage();
    onForegroundMessage();
    _messaging.subscribeToTopic("AllUsers");
  }

  static void listenForInternet() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      if (results.isNotEmpty && results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult)) {
        print("Internet connected! Fetching FCM token...");
        fetchFcmToken();
      }
    });
  }

  static Future<void> fetchFcmToken() async {
    try {
      fcmToken = await _messaging.getToken();
      print("FCM Token: $fcmToken");
    } catch (e) {
      print("Error getting FCM token: $e");
    }
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
