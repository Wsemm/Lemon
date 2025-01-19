import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/Orders/Orders_Controller.dart';
import 'package:lemon/controller/search_Controller.dart';

import '../view/screens/Orders/orders.dart';
import '../view/screens/home/homePage.dart';
import '../view/screens/search.dart';
import '../view/screens/settings.dart';

class HomeScreenController extends GetxController {
  OrdersController ordersController = Get.put(OrdersController());

  int currentPage = 0;
  SearchController2 searchController = Get.find();
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
    searchController.currentPage = 0;
    searchController.searchTextController.clear();
    this.currentPage = currentPage;
    if (this.currentPage == 2) {
      // ordersController.getMyOrders();
    }

    update();
  }
}
