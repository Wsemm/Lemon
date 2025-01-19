import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';

class CustomListStores extends StatelessWidget {
  const CustomListStores(
      {super.key, required this.index, required this.data, this.home});
  final index, data;
  final int? home;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 25,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Card(
        child: SizedBox(
          width: Get.width,
          height: Get.height / 4.5,
          child: Column(
            children: [
              Hero(
                tag:
                    "${data[index]["id"]}_${DateTime.now().microsecondsSinceEpoch}",
                child: CachedNetworkImage(
                  imageUrl: home == 1
                      ? "${data[index]["coverPath"]}"
                      : "${data[index]["coverURL"]}",
                  fit: BoxFit.fill,
                  height: Get.height * 0.10,
                  width: Get.width - Get.width * 0.090,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Get.height * 0.010,
                    right: Get.width * 0.020,
                    left: Get.width * 0.020),
                child: Row(
                  children: [Text("${data[index]["brand"]}")],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.020),
                child: const Row(
                  children: [
                    Text(
                      "Tag",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Get.height * 0.010,
                    right: Get.width * 0.020,
                    left: Get.width * 0.020),
                child: Row(
                  children: [
                    Text(
                      "${data[index]["id"]}",
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
