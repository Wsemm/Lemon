import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lemon/firebase_options.dart';
import 'package:lemon/routs.dart';

import 'core/bindings/initialBindings.dart';
import 'core/cash/cache_helper.dart';
import 'core/constant/AppColor.dart';
import 'core/services/services.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  CacheHelper().init();

  runApp(const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();
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
