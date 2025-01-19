import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/Orders/Orders_Controller.dart';
import 'package:lemon/controller/homePage_Controller.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    HomePageController homePageController = Get.find();
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = homePageController.token!;
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Get.height / 2),
            child: TextFormField(
              controller: textEditingController,
            ),
          ),
          Container(
              child: MaterialButton(
            onPressed: () {
              homePageController.sendNotification();
            },
            child: const Text("send notification"),
          ))
        ],
      ),
    );
  }
}
