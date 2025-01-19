import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Cart_Controller.dart';
import '../../../core/constant/AppColor.dart';

class CartStores extends StatelessWidget {
  const CartStores({super.key, this.index, this.data, this.home});
  final index, data;
  final int? home;
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();

    return Container(
      width: Get.width - 25,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Get.height * 0.010,
            horizontal: Get.width * 0.020,
          ),
          width: Get.width,
          height: Get.height / 5,
          child: Column(
            children: [
              // Hero(
              //   tag:
              //       "${data[index]["id"]}_${DateTime.now().microsecondsSinceEpoch}",
              //   child: CachedNetworkImage(
              //     imageUrl: home == 1
              //         ? "${data[index]["coverPath"]}"
              //         : "${data[index]["coverURL"]}",
              //     fit: BoxFit.fill,
              //     height: Get.height * 0.11,
              //     width: Get.width - Get.width * 0.090,
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.010),
                child: const Row(
                  // children: [Text("${data[index]["brand"]}")],
                  children: [Text("brand")],
                ),
              ),
              Container(
                // margin:
                // EdgeInsets.only(top: Get.height * 0.010),
                child: const Row(
                  children: [
                    Text(
                      "storeId",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.010),
                child: Row(
                  children: [
                    Text(
                      "${data[index].totalAmount}",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
