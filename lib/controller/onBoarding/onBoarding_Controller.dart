import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding_Controller extends GetxController {
  late PageController pageController;
  int currentPage = 0;
  onPageChanged(val) {
    currentPage = val;
    update();
  }

  next() {
    ++currentPage;
    pageController.animateToPage(currentPage,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
