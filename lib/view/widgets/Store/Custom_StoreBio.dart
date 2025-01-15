import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/model/stores_model.dart';
import '../../../controller/Stores/storeProfile_Controller.dart';

class bio extends StatelessWidget {
  const bio({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    StoreProfileController controller = Get.put(StoreProfileController());
    ApiDataRepository repository = Get.find();
    StoresModel storesModel = StoresModel();
    return Center(
        child: Container(
      margin: EdgeInsets.only(
          top: Get.height * 0.17,
          left: Get.width * 0.020,
          right: Get.width * 0.020,
          bottom: Get.height * 0.020),
      width: Get.width,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Get.width * 0.025, top: Get.height * 0.010),
                  child: Text(
                    controller.details == "search" ||
                            controller.details == "filteredStore"
                        ? data["brand"]
                        : "${data[controller.storeId]["brand"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: Get.height * 0.010,
              horizontal: Get.width * 0.020,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Tage Tage",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        controller.details == "search" ||
                                controller.details == "filteredStore"
                            ? "${data["workHours"]["fri"]["startTime"]} AM  -"
                            : "${data[controller.storeId]["workHours"]["fri"]["startTime"]} AM  -",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        child: Text(
                          controller.details == "search" ||
                                  controller.details == "filteredStore"
                              ? "${data["workHours"]["fri"]["endTime"]} PM"
                              : "  ${data[controller.storeId]["workHours"]["fri"]["endTime"]} PM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * 0.020,
              ),
              child: Text(
                controller.details == "search" ||
                        controller.details == "filteredStore"
                    ? "${data["bio"]}"
                    : "${data[controller.storeId]["bio"]}",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
      ),
    ));
  }
}
