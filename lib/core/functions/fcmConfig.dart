import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import 'package:get/get.dart';

final _firebaseMessaging = FirebaseMessaging.instance;

Future<void> initNotifications() async {
  await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(
        animationDuration: Duration(milliseconds: 300),
        "${remoteMessage.notification!.title}",
        "${remoteMessage.notification!.body}");
  });
}

Future<void> subscribeToTopic(String topic) async {
  await _firebaseMessaging.subscribeToTopic(topic);
  print("Subscribed to $topic");
}
