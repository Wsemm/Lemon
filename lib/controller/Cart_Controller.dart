import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lemon/core/api/api/api_consumer.dart';
import 'package:lemon/core/api/api/dio_consumer.dart';
import 'package:lemon/view/screens/cart/cart.dart';

import '../Repositories/ApiDataRepository.dart';
import '../core/api/api/end_points.dart';
import '../core/api/errors/exspitions.dart';
import '../core/class/statusRequest.dart';
import '../model/my_cart_model.dart';

class CartController extends GetxController {
  ApiDataRepository repository = Get.find();
  ApiConsumer api = DioConsumer(dio: Dio());
  MyCartModel myCartModel = MyCartModel();
  StatusRequest statusRequest = StatusRequest.none;
  List<Map<dynamic, int>> productsQuantity = [];
  int quantity = 1;
  var length;
  List test23 = [];
  getProductDetails(id) async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(
        "${EndPoint.getProducts}/$id",
      );
      repository.prodcutDetails = response;

      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
    }

    update();
  }

  getMyCart() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(EndPoint.getMyCart);
      myCartModel = MyCartModel.fromJson(response);
      repository.myCart = myCartModel;

      for (var i = 0; i <= repository.myCart.data!.length - 1; i++) {
        productsQuantity.add({
          "${repository.myCart.data![i].cartItems![0].id}":
              repository.myCart.data![i].cartItems![0].quantity!
        });
      }

      // print("===============${productsQuantity}");
      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
    }

    update();
  }

  patchMyCart(int productId, int quantity, int storeId, CartId) async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.patch("${EndPoint.getMyCart}/$CartId", data: {
        "storeId": storeId,
        "selectedProducts": [
          {"productId": productId, "quantity": quantity}
        ]
      });
      // myCartModel = MyCartModel.fromJson(response);
      // repository.myCart = myCartModel;

      // for (var i = 0; i <= repository.myCart.data!.length - 1; i++) {
      //   productsQuantity.add({
      //     "${repository.myCart.data![i].cartItems![0].id}":
      //         repository.myCart.data![i].cartItems![0].quantity!
      //   });
      // }

      // print("===============${productsQuantity}");
      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
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

  addQuantity() {
    quantity++;
  }

  removeQuantity() {
    quantity--;
  }

  @override
  void onInit() {
    getMyCart();
    super.onInit();
  }
}
