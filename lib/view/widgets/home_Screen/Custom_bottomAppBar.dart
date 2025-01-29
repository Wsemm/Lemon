import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/homeScreen_Controller.dart';
import 'package:lemon/core/constant/AppColor.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) => Container(
        height: Get.height * 0.075,
        decoration: const BoxDecoration(
            color: AppColor.secondColor,
            border: Border(
                top: BorderSide(width: 3, color: AppColor.primaryColor))),
        child: BottomAppBar(
          color: Colors.grey[300],
          // color: AppColor.primaryColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            // margin: EdgeInsets.symmetric(
            //   horizontal: Get.width * 0.005,
            // ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(controller.listPage.length + 1, (index) {
                  int i = index > controller.listPage.length - 2
                      ? index - 1
                      : index;

                  return index == 2
                      ? const Spacer()
                      : SizedBox(
                          width: Get.width * 0.19,
                          child: CustomButtonAppBar(
                            onPressed: () {
                              controller.changePage(i);
                            },
                            // TextButton: controller.bottomappBar[i]['title'],
                            iconData: controller.bottomappBar[i]['icon'],
                            active: controller.currentPage == i ? true : false,
                          ),
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  // final String? TextButton;
  final IconData iconData;
  final bool? active;

  const CustomButtonAppBar(
      {super.key,
      required this.onPressed,
      //  required this.TextButton,
      required this.iconData,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        iconData,
        color: active == true ? AppColor.primaryColor : Colors.grey[600],
        size: Get.width * 0.070,
      ),
    );
  }
}
