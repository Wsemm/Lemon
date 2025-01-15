import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/Orders/Orders_Controller.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold();
  }
}
