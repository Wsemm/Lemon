import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onBoarding/onBoarding_Controller.dart';

import '../../core/constant/AppImage.dart';
import '../widgets/onBoarding/onBoarding_Slider.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoarding_Controller controller = Get.put(OnBoarding_Controller());
    return PageView(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      children: const [
        OnBoarding_Slider(
          image: AppImage.onboarding1,
          text: "Consult with only a  doctor \n you trust",
        ),
        OnBoarding_Slider(
          image: AppImage.onboarding2,
          text: "Find a lot of specialist \n doctors in one place",
        ),
        OnBoarding_Slider(
          image: AppImage.onboarding3,
          text: "Get connect our Online \n Consultation",
        ),
        onBoading_Auth()
      ],
    );
  }
}
