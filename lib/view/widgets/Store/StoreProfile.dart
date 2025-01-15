import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/core/class/statusRequest.dart';

import '../../../core/functions/requestStatusControl.dart';
import '../../../routs.dart';
import 'Custom_StoreBio.dart';

import '../Custom_ListProducts.dart';
import 'MyAppBar.dart';

class CustomStoreProfile extends StatelessWidget {
  const CustomStoreProfile(
      {super.key,
      required this.storeData,
      required this.storeProductData,
      required this.scrollController,
      // required this.index,
      required this.statusRequest,
      required,
      required this.resevedData,
      required this.controllerIndex,
      required this.newData,
      required this.newData2});
  final storeData;
  final storeProductData;
  final newData;
  final newData2;
  final ScrollController? scrollController;
  // final int index;
  final StatusRequest statusRequest;
  final String resevedData;
  final int controllerIndex;
  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    return SizedBox(
      height: Get.height,
      // color: Colors.black,
      child: ListView(
        controller: scrollController,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            // color: Colors.green,
            height: Get.height / 2.5,
            child: Stack(
              children: [
                if (statusRequest == StatusRequest.sucess)
                  Hero(
                    tag: resevedData == "filteredStore"
                        ? "${newData["id"]}"
                        : resevedData == "store"
                            ? "${storeData[controllerIndex]["id"]}"
                            : "${newData2["id"]}",
                    child: SizedBox(
                      child: CachedNetworkImage(
                          imageUrl: resevedData == "filteredStore"
                              ? "${newData["coverPath"]}"
                              : resevedData == "store"
                                  ? "${storeData[controllerIndex]["coverPath"]}"
                                  : "${newData2["coverPath"]}"),
                    ),
                  ),
                const StoreProfileAppBar(),
                if (statusRequest == StatusRequest.sucess)
                  bio(
                    data: resevedData == "store"
                        ? storeData
                        : resevedData == "filteredStore"
                            ? newData
                            : newData2,
                  )
              ],
            ),
          ),
          handlingRequestStatus(
              statusRequest: statusRequest,
              widget: Column(
                children: [
                  ...List.generate(
                      // controller.storeData.length,
                      storeProductData.length,
                      (index) => Container(
                            margin: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                // print("${controller.storeData[10]}");
                                Get.toNamed(AppRout.productDetails, arguments: {
                                  "productId": index,
                                  "details": "store"
                                });
                              },
                              child: CustomListProductsStore(
                                  list: 1,
                                  // data: repository.storeInfoModel,
                                  // data: controller.storeData,
                                  data: resevedData == "store"
                                      ? storeProductData
                                      : storeProductData,
                                  // data: data,
                                  index: index),
                            ),
                          ))
                ],
              ))
        ],
      ),
    );
  }
}
