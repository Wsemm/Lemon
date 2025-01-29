import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'Orders/Orders_Controller.dart';
import 'homePage_Controller.dart';
import 'search_Controller.dart';

import '../view/screens/Orders/orders.dart';
import '../view/screens/home/homePage.dart';
import '../view/screens/search.dart';
import '../view/screens/settings.dart';

class HomeScreenController extends GetxController {
  OrdersController ordersController = Get.put(OrdersController());
  HomePageController homePageController = Get.find();
  String displayedText = "";
  String fullText = "";
  Timer? typingTimer;
  int currentIndex = 0;
  RxBool isExpanded = false.obs;
  TextEditingController requsetTextController = TextEditingController();
  int currentPage = 0;
  SearchController2 searchController = Get.find();
  String test = "";

  List bottomappBar = [
    {"title": "home", "icon": Icons.home},
    {"title": "search", "icon": Icons.search},
    {"title": "orders", "icon": Icons.inventory_outlined},
    {
      "title": "settings",
      "icon": Icons.settings,
    }
  ];

  List<Widget> listPage = [
    const homePage(),
    const Search(),
    const Orders(),
    const Settings(),
  ];

  changePage(int currentPage) {
    isExpanded = false.obs;
    searchController.currentPage = 0;
    searchController.searchTextController.clear();
    this.currentPage = currentPage;
    if (this.currentPage == 2) {
      // ordersController.getMyOrders();
    }

    update();
  }

  void startTypingAnimation() {
    print("animation=========");

    typingTimer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      if (currentIndex < fullText.length) {
        displayedText += fullText[currentIndex];
        currentIndex++;
        // print(displayedText);

        update();
      }
    });
  }

  sendForChatBot() async {
    final model = GenerativeModel(
        model: "gemini-pro", apiKey: "AIzaSyBNBgS7FqIwkfxpL7NZZgG3EUPvMSNKDiM");
    final content = [
      // Content.text(
      //     "tell me in shor some advices about sport medicens like protin powder and somthing like taht")
      Content.text(requsetTextController.text)
    ];
    final response = await model.generateContent(content);
    print(response.text);
    fullText = response.text!;
    startTypingAnimation();
  }
}
