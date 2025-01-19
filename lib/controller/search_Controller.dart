import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Repositories/ApiDataRepository.dart';
import '../core/api/api/api_consumer.dart';
import '../core/api/api/dio_consumer.dart';
import '../core/api/api/end_points.dart';
import '../core/api/errors/exspitions.dart';
import '../core/class/statusRequest.dart';

class SearchController2 extends GetxController {
  int currentPage = 0;
  int page = 1;
  int limt = 5;
  PageController? pageController;
  ApiConsumer api = DioConsumer(dio: Dio());
  StatusRequest statusRequest = StatusRequest.none;
  List<dynamic> data = [], searchData = [];
  var searchStoreData = [];
  late TextEditingController searchTextController;
  ApiDataRepository repository = Get.find();
  int searchHistoryProducts = 0;
  int searchHistoryStores = 0;
  int isStoreEmpty = 0, isProductEmpty = 0;
  String previousValue = '';
  Timer? _debounce;
  int firstTime = 1;
  final TextEditingController _controller = TextEditingController();

  void onSearchChanged() {
    if (firstTime == 1) {
      statusRequest = StatusRequest.loading;
      firstTime = 0;

      update();
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      // Call your API or perform your search here
      searchHistoryProducts = 0;
      searchHistoryStores = 0;
      firstTime = 1;

      getSearchProducts();

      // Example: performSearch(query);
    });
  }

  getSearchProducts() async {
    searchData.clear();
    statusRequest = StatusRequest.loading;
    update();
    try {
      switch (currentPage) {
        case 2:
          searchHistoryProducts = 1;

          final response = await api.get(EndPoint.getProducts,
              queryParameters: {
                "search": searchTextController.text,
                "page": 1,
                "limit": 5
              });
          searchData = response;
          repository.saveData(int, searchData);

          if (searchData.isEmpty) {
            isProductEmpty = 1;
            update();
          } else {
            isProductEmpty = 0;
          }

          break;
        case 1:
          searchHistoryStores = 1;

          final response = await api.get(EndPoint.getStores, queryParameters: {
            "search": searchTextController.text,
            "page": 1,
            "limit": 5
          });

          // print("========${response}");
          searchStoreData = response["data"];
          repository.saveData(bool, searchStoreData);
          print("aaaaaa$searchStoreData");
          if (searchStoreData.isEmpty) {
            isStoreEmpty = 1;
            update();
          } else {
            isStoreEmpty = 0;
          }

          break;
        default:
      }

      // productsModel = ProductsModel.fromJson(response);
      //  repository.saveData(LoginModel, loginModel);
      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar("failuer", e.errModel.message.toString());
    }

    update();
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  next(index) {
    pageController!.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
  }

  search() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      switch (currentPage) {
        case 0:
          final response = await api.get(EndPoint.getProducts,
              queryParameters: {
                "search": searchTextController.text,
                "page": 1,
                "limit": 5
              });
          searchData = response;

          // print("===========${response}");

          break;
        case 1:
          final response = await api.get(EndPoint.getProducts, data: {});
          break;
        case 2:
          final response = await api.get(EndPoint.getProducts, data: {});
          break;
        default:
      }

      statusRequest = StatusRequest.sucess;
      // Get.snackbar("success", "Login success");
      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      // Get.snackbar("failuer", "{e.errModel.message");
    }

    update();
  }

  @override
  void onInit() {
    searchTextController = TextEditingController();
    pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    _controller.dispose();
    super.onClose();
  }
}
