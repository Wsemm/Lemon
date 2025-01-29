import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routs.dart';
import '../../core/constant/AppColor.dart';
import '../../core/constant/AppImage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // @override
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(milliseconds: 2500), () {
      Get.offNamed(AppRout.splashScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // homePageController controller = Get.put(homePageController());
    // Auth_Controller auth_controller = Get.put(Auth_Controller());
    // Get.put(SplashScreenController());
    return EasySplashScreen(
      logo: Image.asset(
        AppImage.logo,
        width: 400,
        height: 400,
      ),
      title: const Text(
        "Lemon",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loaderColor: AppColor.primaryColor,
      loadingText: const Text("Loading..."),
      // navigator:
      //     CacheHelper().getData(key: "step") == "1" ? SignUP() : homePage(),
      durationInSeconds: 2,
    );
  }
}
