import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class NotificationsServices {
  FirebaseMessaging messaging =FirebaseMessaging.instance;

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }

  }

  Future<String?> getDeviceToken() async {
    String? token = await messaging.getToken();
    debugPrint("Device Token: $token");
    return token;
  } 

  void isTokenRefresh() {
    messaging.onTokenRefresh.listen((newToken) {
      newToken.toString();
      debugPrint("Refreshed Token: $newToken");
    });
  }
}