import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lemon/core/functions/fcmConfig.dart';
import 'package:lemon/core/functions/firebase.dart';
import 'firebase_options.dart';
import 'routs.dart';

import 'core/bindings/initialBindings.dart';
import 'core/cash/cache_helper.dart';
import 'core/constant/AppColor.dart';
import 'core/services/services.dart';
import 'package:firebase_core/firebase_core.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: AppColor.primaryColor)),
      // ThemeData(
      //   primarySwatch: Colors.blue,
      // ),

      getPages: getPages,
      initialBinding: InitialBindings(),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
