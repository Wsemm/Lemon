import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/core/api/api/api_consumer.dart';
import 'package:lemon/core/api/api/dio_consumer.dart';
import 'package:lemon/model/store_info_model.dart';
import '../../core/api/api/end_points.dart';
import '../../core/api/errors/exspitions.dart';
import '../../core/class/statusRequest.dart';

class StoreProfileController extends GetxController {
  ApiConsumer api = DioConsumer(dio: Dio());
  ApiDataRepository repository = Get.find();
  ScrollController scrollController = ScrollController();
  StatusRequest statusRequest = StatusRequest.none;
  StoreInfoModel? storeInfoModel;
  late int storeId;
  bool isShowSearch = false;
  Map storeData = {};
  late int id, storeSearch;
  late String details;

  getStoreInfo() async {
    var response;
    statusRequest = StatusRequest.loading;
    update();
    try {
      if (details == "search") {
        storeData.clear();
        response = await api.get(
          "${EndPoint.getStores}/$storeSearch/profile",
        );
        repository.test = response["data"];
        storeData = response["data"];
        print("+++++++++++++${repository.test}");
      } else if (details == "filteredStore") {
        response = await api.get(
          "${EndPoint.getStores}/$storeId/profile",
        );
        repository.searchStoreInfoData = response["data"];
        print("hhhhhhhhhhhhhhh ${repository.searchStoreInfoData}");
      } else if (details == "store") {
        response = await api.get(
          "${EndPoint.getStores}/${repository.storesModel[storeId]["id"]}/profile",
        );
      }
      // else if (details == "homepage") {
      //   response = await api.get(
      //     "${EndPoint.getStores}/$storeId/profile",
      //   );
      // }

      // storeData = response["products"];
      storeInfoModel = StoreInfoModel.fromJson(response["data"]);
      repository.saveData(StoreInfoModel, storeInfoModel);
      repository.saveData(String, response);
      print(
          "===========================${repository.storeProducts}===========================");

      // print(
      //     "=============${repository.storeInfoModel.products![1].id}=============");
      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar("failuer", e.errModel.message);
    }

    update();
  }

  @override
  void onInit() {
    // searchBarView();
    storeId = Get.arguments["storeId"];
    details = Get.arguments["details"];
    if (Get.arguments["storesearch"] != null) {
      storeSearch = Get.arguments["storesearch"];
    }

    getStoreInfo();

    super.onInit();
  }
}
