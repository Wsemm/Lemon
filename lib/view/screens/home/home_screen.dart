import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/Products/product_controller.dart';
import 'package:lemon/core/constant/AppImage.dart';

import '../../../controller/HomeScreen_Controller.dart';
import '../../../core/constant/AppColor.dart';
import '../../widgets/home_Screen/Custom_bottomAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());

    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.secondColor,

          onPressed: () {},
          // child: const Icon(Icons.shopping_basket_outlined),
          child: const CircleAvatar(
            backgroundImage: AssetImage(AppImage.robot),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: WillPopScope(
            child: controller.listPage.elementAt(controller.currentPage),
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
