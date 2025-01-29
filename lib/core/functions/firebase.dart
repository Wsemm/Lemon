import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:lemon/main.dart';
import 'package:lemon/routs.dart';

class FirebaseNotifications {
  //* Create instance of FBM
  final _firebaseMessaging = FirebaseMessaging.instance;
  //* Initialize notifications for this app or device
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("Token: $token");
    handleBackgroundNotification();
  }

  //* handle notifications when recieved
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState!.pushNamed(AppRout.homeMade, arguments: message);
  }

  //* handle notifications in case of app is terminated
  Future handleBackgroundNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessage.listen(handleMessage);
  }
}
