import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/homePage_Controller.dart';
import '../../../controller/homeScreen_Controller.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppImage.dart';
import '../../widgets/home_Screen/Custom_bottomAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    HomePageController homePageController = Get.find();

    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(
                top: controller.isExpanded.value ? Get.height * 0.080 : 0),
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: AppColor.secondColor,

              onPressed: () {
                controller.isExpanded.value = !controller.isExpanded.value;
              },
              // child: const Icon(Icons.shopping_basket_outlined),
              child: const CircleAvatar(
                backgroundImage: AssetImage(AppImage.robot),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: WillPopScope(
            child: Stack(
              children: [
                controller.listPage.elementAt(controller.currentPage),
                Obx(
                  () => AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    bottom: controller.isExpanded.value
                        ? 0
                        : -MediaQuery.of(context).size.height * 0.75,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.primaryColor),
                            color: AppColor.secondColorLight,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  controller.requsetTextController.text.isEmpty
                                      ? Get.height * 0.65
                                      : Get.height * 0.40,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Container(
                                      margin: EdgeInsets.all(Get.width * 0.030),
                                      child: Text(
                                        controller.displayedText,
                                        style: const TextStyle(fontSize: 20),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              margin: EdgeInsets.all(Get.width * 0.020),
                              child: TextField(
                                onChanged: (val) {
                                  controller.update();
                                },
                                controller: controller.requsetTextController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.displayedText = "";
                                        controller.fullText = "";
                                        controller.sendForChatBot();
                                        controller.requsetTextController
                                            .clear();
                                        controller.currentIndex = 0;
                                      },
                                      child: const Icon(Icons.send),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            onWillPop: () {
              Get.defaultDialog(
                confirmTextColor: Colors.white,
                cancelTextColor: Colors.red,
                buttonColor: AppColor.primaryColor,
                title: "Warnning",
                middleText: "Do you need to Exit the app",
                onCancel: () {},
                onConfirm: () {
                  exit(0);
                },
              );
              return Future.value(false);
            }),
      ),
    );
  }
}
