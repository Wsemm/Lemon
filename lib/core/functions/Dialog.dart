import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/AppColor.dart';

myShowDialog(String title, middleText, leftButtonTitle, rightButtonTitle,
    Function LeftButton, rightButton) {
  Get.defaultDialog(title: title, middleText: middleText, actions: [
    Container(
      child: MaterialButton(
        color: Colors.red,
        shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          LeftButton();
        },
        child: const Text(
          "Skip",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    MaterialButton(
      color: AppColor.primaryColor,
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        rightButton();
      },
      child: const Text(
        "yes",
        style: TextStyle(color: Colors.white),
      ),
    )
  ]);
}
