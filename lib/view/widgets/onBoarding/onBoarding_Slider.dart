import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/onBoarding/onBoarding_Controller.dart';
import 'package:lemon/routs.dart';
import 'package:lemon/view/widgets/Custom_Button.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppImage.dart';

class OnBoarding_Slider extends StatelessWidget {
  const OnBoarding_Slider({super.key, required this.image, required this.text});
  final String image, text;

  @override
  Widget build(BuildContext context) {
    OnBoarding_Controller controller = Get.put(OnBoarding_Controller());
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Container(
              margin: EdgeInsets.only(bottom: Get.height * 0.030),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  onPressed: () {
                    controller.next();
                  },
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ))),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: Get.width / 1.3),
                child: MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRout.chatbot);
                    // controller.pageController.animateToPage(3,
                    //     duration: const Duration(milliseconds: 750),
                    //     curve: Curves.ease);
                  },
                  child: const Text(
                    "skip",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
              Center(
                  child: Container(
                margin: EdgeInsets.only(top: Get.height * 0.010),
                child: Image.asset(image),
              )),
              Center(
                  child: Container(
                margin: EdgeInsets.only(top: Get.height * 0.050),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              )),
              GetBuilder<OnBoarding_Controller>(
                builder: (controller) => Container(
                  margin: EdgeInsets.only(
                      top: Get.height * 0.070, left: Get.width * 0.080),
                  child: Row(
                    children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                  color: controller.currentPage == index
                                      ? AppColor.primaryColor
                                      : AppColor.primaryColorLight,
                                  borderRadius: BorderRadius.circular(5)),
                              width: controller.currentPage == index
                                  ? Get.width * 0.05
                                  : Get.width * 0.03,
                              height: controller.currentPage == index
                                  ? Get.height * 0.012
                                  : Get.height * 0.01,
                              duration: const Duration(seconds: 1),
                            )),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class onBoading_Auth extends StatelessWidget {
  const onBoading_Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width / 8),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: Get.height / 5),
                  child: Column(
                    children: [
                      Image.asset(
                        AppImage.logo,
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        child: const Text(
                          "Lemon",
                          style: TextStyle(
                              color: AppColor.primaryColor, fontSize: 25),
                        ),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.040),
                child: const Text(
                  "Let's get started!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: Get.height * 0.040, top: Get.height * 0.010),
                child: const Text(
                  "Login to enjoy the features we've \n     provided, and stay healthy!",
                  style: TextStyle(fontSize: 19, color: Colors.grey),
                ),
              ),
              Custom_Button(
                onPressed: () {
                  Get.toNamed(AppRout.login);
                },
                color: AppColor.secondColor,
                text: "Login",
                textcolor: Colors.white,
              ),
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.020),
                width: Get.width,
                height: Get.height * 0.070,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: AppColor.secondColor),
                    borderRadius: BorderRadius.circular(30)),
                child: MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRout.signUP);
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
