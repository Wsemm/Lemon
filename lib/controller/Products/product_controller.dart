import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/core/api/api/api_consumer.dart';
import 'package:lemon/core/api/api/dio_consumer.dart';
import 'package:lemon/model/products_model.dart';

import '../../core/api/api/end_points.dart';
import '../../core/api/errors/exspitions.dart';
import '../../core/class/statusRequest.dart';

class ProductDetailsController extends GetxController {
  ApiConsumer api = DioConsumer(dio: Dio());
  ApiDataRepository repository = ApiDataRepository();

  StatusRequest statusRequest = StatusRequest.none;
  ProductsModel? productsModel;
  late int index;
  late String screen;

  getProductDetails(id) async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(
        "${EndPoint.getProducts}/$id",
      );
      repository.prodcutDetails=response;

      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar("failuer", "{e.errModel.message");
    }

    update();
  }

  checkOut(
      int productId,
      int price,
      int quantity,
      int storeId,
      String productName,
      String phoneNumber,
      String customerName,
      String city,
      String addressLine) async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.post(EndPoint.orderCheckOut, data: {
        "storeId": storeId,
        "deliveryDetails": {
          "phoneNumber": "$phoneNumber",
          "customerName": "$customerName",
          "city": "$city",
          "addressLine": "$addressLine"
        },
        "cartItems": [
          {
            "productId": productId,
            "productName": "$productName",
            "price": price,
            "quantity": quantity
          }
        ]
      });

      statusRequest = StatusRequest.sucess;
      Get.snackbar("success", "the prodcut has successfully orderd");
      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
    }

    update();
  }

  addToCart(int storeId, int productId, int quantity) async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.post(EndPoint.getMyCart, data: {
        "storeId": storeId,
        "selectedProducts": [
          {"productId": productId, "quantity": quantity}
        ]
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

  List<Color> colorList = [
    Colors.green,
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.yellow
  ];

  @override
  void onInit() {
    index = Get.arguments["productId"];
    screen = Get.arguments["details"];

    super.onInit();
  }
}
