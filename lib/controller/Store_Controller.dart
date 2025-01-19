import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/core/api/api/api_consumer.dart';
import 'package:lemon/core/api/api/dio_consumer.dart';
import 'package:lemon/model/stores_model.dart';

import '../core/api/api/end_points.dart';
import '../core/api/errors/exspitions.dart';
import '../core/class/statusRequest.dart';
import '../model/store_Categories_model.dart';

class StoreController extends GetxController {
  ApiConsumer api = DioConsumer(dio: Dio());
  ApiDataRepository repository = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequest2 = StatusRequest.none;
  StoreCategories_model storeCategories_model = StoreCategories_model();
  List data = [];
  List storesTags = [];
  List selectedCats = [], indexList = [];
  int page = 1, limt = 10, pageById = 1;
  final ScrollController scrollController = ScrollController();

  bool isMoreData = true, isMoreData2 = true;

  late String id2;
  int selectedCat = 1000;
  int selectedCat2 = 1000;

  late int filter;

  getStores() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(EndPoint.getStores, queryParameters: {
        "page": repository.page,
        "limit": 10,
      });
      // loginModel = LoginModel.fromJson(response);
      repository.page++;
      // data.addAll(response["data"]);
      data = response["data"];

      repository.saveData(StoresModel, data);
      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException {
      serverFailuer(
          statusRequest = StatusRequest.failuer, "e.errModel.message");
      Get.snackbar("failuer", "e.errModel.message");
      update();
    }
  }

  getStoresTag() async {
    statusRequest = StatusRequest.loading;
    filter = 1;
    update();
    try {
      final response = await api.get(EndPoint.getStores, queryParameters: {
        "page": repository.page,
        "limit": 10,
        "tagIds": selectedCats,
      });
      // loginModel = LoginModel.fromJson(response);
      repository.page++;
      // data.addAll(response["data"]);
      data = response["data"];
      repository.test2 = data;
      print("===========${repository.test2}");
      repository.saveData(StoresModel, data);
      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException {
      serverFailuer(
          statusRequest = StatusRequest.failuer, "e.errModel.message");
      Get.snackbar("failuer", "e.errModel.message");
      update();
    }
  }

  getStoresById() async {
    statusRequest2 = StatusRequest.loading;
    filter = 1;
    // id2 = id;

    update();
    try {
      // if (repository.storesModelById[
      //         "${repository.storeCategories.data![selectedCat2].id}"] ==
      //     null) {
        final response = await api.get(EndPoint.getStores,
            queryParameters: {"page": 1, "limit": 10, "tagIds": selectedCats});
        // loginModel = LoginModel.fromJson(response);

        // data.addAll(response["data"]);
        data = response["data"];
        repository.test2 = data;
        print("===================${repository.test2}");
        repository.storesModelById.addAll(
            {"${repository.storeCategories.data![selectedCat2].id}": data});
        repository.storesModelByIdPages.addAll(
            {"${repository.storeCategories.data![selectedCat2].id}": 1});
      // }

      // repository.saveData(StoresModel, data);
      statusRequest2 = StatusRequest.sucess;
      // print("aaaaaaaaaaa ${repository.storesModelById}aaaaa");

      update();
    } on ServerException {
      serverFailuer(
          statusRequest = StatusRequest.failuer, "e.errModel.message");
      Get.snackbar("failuer", "e.errModel.message");
      update();
    }
  }

  pageinationData() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        statusRequest = StatusRequest.loading;
        update();
        if (isMoreData == true && filter == 0) {
          try {
            final response = await api.get(EndPoint.getStores,
                queryParameters: {"page": repository.page, "limit": limt});

            if (response["data"].length > 0) {
              repository.page++;
              repository.storesModel.addAll(response["data"]);
              // data.addAll(response["data"]);
              // repository.saveData(StoresModel, data);

              statusRequest = StatusRequest.sucess;
              update();
            } else if (response["data"].length == 0) {
              // repository.page = 1;
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
        if (repository.storesModelByIdMoreData[
                    "${repository.storeCategories.data![selectedCat2].id}"] !=
                1 &&
            filter == 1) {
          try {
            final response =
                await api.get(EndPoint.getStores, queryParameters: {
              "page":
                  "${repository.storesModelByIdPages["${repository.storeCategories.data![selectedCat2].id}"] + 1}",
              "limit": 10,
              "tagIds": selectedCats
            });

            if (response["data"].length > 0) {
              repository.pageById++;
              repository.storesModelById.addAll(response["data"]);
              // data.addAll(response["data"]);
              // repository.saveData(StoresModel, data);

              statusRequest = StatusRequest.sucess;
              update();
            } else if (response["data"].length == 0) {
              // repository.page = 1;
              isMoreData2 = false;
              repository.storesModelByIdMoreData[
                  "${repository.storeCategories.data![selectedCat2].id}"] = 1;
              statusRequest = StatusRequest.sucess;
              update();
            }
          } on ServerException catch (e) {
            serverFailuer(
                statusRequest = StatusRequest.failuer, e.errModel.message);
            Get.snackbar("failuer", "{e.errModel.message");
          }
        }
      }
    });
  }

  getCategories() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.get(
        EndPoint.storesTags,
      );
      storesTags = response["data"];
      storeCategories_model = StoreCategories_model.fromJson(response);
      repository.saveData(StoreCategories_model, storeCategories_model);

      statusRequest = StatusRequest.sucess;

      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
    }

    update();
  }

  @override
  void onInit() {
    filter = repository.filter;
    if (repository.page == 1) {
      getStores();
    }
    getCategories();
    pageinationData();
    super.onInit();
  }
}
