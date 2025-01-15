import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/AppImage.dart';

class CustomCartProduct extends StatelessWidget {
  CustomCartProduct({super.key, required this.quantity});
  int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(AppImage.doctor1),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left: Get.width * 0.020, bottom: Get.height * 0.040),
                      child: Text("name")),
                  Container(
                      margin: EdgeInsets.only(left: Get.width * 0.020),
                      child: Text("price"))
                ],
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    quantity--;
                  },
                  icon: Icon(Icons.remove)),
              Text("$quantity"),
              IconButton(
                  onPressed: () {
                    quantity++;
                  },
                  icon: Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
