import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_Messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/controller/Auth/auth_Controller.dart';
import 'package:lemon/core/api/api/api_consumer.dart';
import 'package:lemon/core/api/api/dio_consumer.dart';
import 'package:lemon/core/cash/cache_helper.dart';
import 'package:lemon/core/constant/AppImage.dart';
import 'package:lemon/model/products_model.dart';
import 'package:path/path.dart';
import '../core/api/api/end_points.dart';
import '../core/api/errors/exspitions.dart';
import '../core/class/statusRequest.dart';
import '../model/profile_model.dart';

class homePageController extends GetxController {
  int pageIndex = 0;
  int page = 1;
  int limt = 5;
  List images = [], mainCategories = [];
  ApiConsumer api = DioConsumer(dio: Dio());
  StatusRequest statusRequest = StatusRequest.none;
  ProductsModel? productsModel;
  List<dynamic> data = [], searchData = [];
  bool isMoreData = true;
  final ScrollController scrollController = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  TextEditingController searchTextController = TextEditingController();
  PageController pageController = PageController();
  ApiDataRepository repository = Get.find();
  ProfileModel? profileModel;

  List<ProductsModel> data2 = [];

  List ListImages = [
    {"title": "Home made", "image": AppImage.doctor1},
    {"title": "Brands", "image": AppImage.doctor2},
    {"title": "doctors", "image": AppImage.doctor3},
  ];

  List listDoctors = [
    {"name": "doc1", "image": AppImage.doctor1},
    {"name": "doc2", "image": AppImage.doctor2},
    {"name": "doc3", "image": AppImage.doctor3},
    {"name": "doc4", "image": AppImage.doctor1},
    {"name": "doc5", "image": AppImage.doctor2},
    {"name": "doc6", "image": AppImage.doctor3},
  ];

  List<IconData> pageIcons = [
    Icons.home,
    Icons.inventory_outlined,
    Icons.person,
    Icons.settings
  ];

  Widget buildimage(int index) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //   horizontal: 5,
      // ),
      child: CachedNetworkImage(
        imageUrl: images[index]["imagePath"],
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  getProducts(page, limt) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(EndPoint.getProducts,
          queryParameters: {"page": page, "limit": limt});
      data = response;

      // productsModel = ProductsModel.fromJson(data);
      repository.saveData(ProductsModel, data);
      statusRequest = StatusRequest.sucess;
      // data2.addAll(response);

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar("failuer", "{e.errModel.message");
    }

    update();
  }

  onPageChanged(val) {
    pageIndex = val;
    update();
  }

  pageViewScroll() {
    if (pageIndex == 3) {
      pageIndex = 0;
    }
    while (pageIndex != 10) {
      Future.delayed(Duration(seconds: 3), () {
        print(":dsa");
        ++pageIndex;
        pageController.animateToPage(pageIndex,
            duration: Duration(milliseconds: 500), curve: Curves.linear);

        update();
      });
    }
  }

  getSearchProducts() async {
    searchData.clear();
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(EndPoint.getProducts, queryParameters: {
        "search": "${searchTextController.text}",
        "page": 1,
        "limit": 5
      });
      searchData = response;
      // productsModel = ProductsModel.fromJson(response);
      //  repository.saveData(LoginModel, loginModel);
      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar("failuer", "{e.errModel.message");
    }

    update();
  }

  pageinationData() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        statusRequest = StatusRequest.loading;
        update();
        if (isMoreData == true) {}
        try {
          final response = await api.get(EndPoint.getProducts,
              queryParameters: {"page": page, "limit": limt});

          if (response.length > 0) {
            data.addAll(response);
            statusRequest = StatusRequest.sucess;

            update();
          } else if (response.length == 0) {
            isMoreData = false;
            statusRequest = StatusRequest.sucess;
            update();
          }
        } on ServerException catch (e) {
          serverFailuer(
              statusRequest = StatusRequest.failuer, e.errModel.message);
          Get.snackbar("failuer", "{e.errModel.message");
        }
      }
    });
  }
  //   pageinationData2() {
  //   scrollController2.addListener(() async {
  //     if (scrollController2.position.pixels ==
  //         scrollController2.position.maxScrollExtent) {
  //       page++;
  //       statusRequest = StatusRequest.loading;
  //       update();
  //       if (isMoreData == true) {}
  //       try {
  //         final response = await api.get(EndPoint.getProducts,
  //             queryParameters: {"page": page, "limit": limt});

  //         if (response.length > 0) {
  //           data.addAll(response);
  //           statusRequest = StatusRequest.sucess;

  //           update();
  //         } else if (response.length == 0) {
  //           isMoreData = false;
  //           statusRequest = StatusRequest.sucess;

  //           update();
  //         }
  //       } on ServerException catch (e) {
  //         serverFailuer(
  //             statusRequest = StatusRequest.failuer, e.errModel.message);
  //         Get.snackbar("failuer", "{e.errModel.message");
  //       }
  //     }
  //   });
  // }

  getPersonalInfo() async {
    update();
    try {
      final response = await api.get(
        EndPoint.updateProfile,
      );
      profileModel = ProfileModel.fromJson(response);
      repository.saveData(ProfileModel, profileModel);

      update();
    } on ServerException catch (e) {
      update();
    }
  }

  getSliders() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(
        EndPoint.home,
      );
      images = response["data"]["sliders"];
      mainCategories = response["data"]["mainCategories"];
      statusRequest = StatusRequest.sucess;
      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
    }

    update();
  }

  getSection() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(EndPoint.homeSections);
      repository.sections = response["data"];

      // for (var i = 0; i < response["data"].length; i++) {
      //   if (response["data"][i]["type"] == "product") {
      //     repository.test2 = response["data"][i];
      //     print("========================================${repository.test2}");
      //     // print(
      //     //     "========================================== ${response["data"][i]["items"]}");
      //   }
      // }

      statusRequest = StatusRequest.sucess;
      // Get.snackbar("success", "Login success");
      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      // Get.snackbar("failuer", "{e.errModel.message");
    }

    update();
  }

  final _firebaseMessaging = FirebaseMessaging.instance;
  String? token;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    token = await _firebaseMessaging.getToken();
    print("Token: $token");
    print(
        "==================================================================================");
  }

  Notification() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.post(EndPoint.notification, data: {
        "title": "title_test",
        "body": "body_test",
        "deviceId": "$token"
      });

      statusRequest = StatusRequest.sucess;
      Get.snackbar("success", "Login success");
      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar("failuer", "{e.errModel.message");
    }

    update();
  }

  @override
  void onInit() {
    // pageViewScroll();
    // pageinationData2();

    getPersonalInfo();
    getSliders();
    getSection();
    // pageinationData();
    // getProducts(page, limt);
    initNotifications();
    super.onInit();
  }
}
