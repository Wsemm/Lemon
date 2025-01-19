import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/AppColor.dart';

class CartProductSkelton extends StatelessWidget {
  const CartProductSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondColor),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(
        vertical: Get.height * 0.010,
        horizontal: Get.width * 0.014,
      ),
      width: Get.width,
      height: Get.height / 8,
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.grey[350],
                height: double.infinity,
              )),
          Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            bottom: Get.height * 0.020,
                            top: Get.height * 0.010,
                            left: Get.width * 0.020),
                        child: const Text(
                          "name",
                          style: TextStyle(color: Colors.grey),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: Get.width * 0.020),
                        child: const Text(
                          "price",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                // margin: EdgeInsets.only(left: Get.width * 0.020),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Container(
                          child: const Icon(Icons.remove, color: Colors.grey),
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.010,
                      ),
                      child: const Text(
                        "quantity",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          child: const Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
