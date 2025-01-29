import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/userInfo_Controller.dart';
import '../../widgets/Custom_Button.dart';

import '../../widgets/Custom_TextFormField2.dart';

class AddUserAddress extends StatelessWidget {
  const AddUserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfoController controller = Get.find();
    return Scaffold(
      body: Form(
          child: Column(
        children: [
          CustomTextFormField(
            text: "label",
            prefix: Icons.abc,
            controller: controller.labeTextController,
          ),
          CustomTextFormField(
            text: "details",
            prefix: Icons.abc,
            controller: controller.detailsTextController,
          ),
          CustomTextFormField(
            text: "area",
            prefix: Icons.abc,
            controller: controller.areaTextController,
          ),
          CustomTextFormField(
            text: "city",
            prefix: Icons.abc,
            controller: controller.cityTextController,
          ),
          CustomTextFormField(
            text: "street",
            prefix: Icons.abc,
            controller: controller.streetTextController,
          ),
          CustomTextFormField(
            text: "phone Number",
            prefix: Icons.abc,
            controller: controller.phoneNumberTextController,
          ),
          Custom_Button(
              text: "add",
              onPressed: () {
                controller.addAddress();
              })
        ],
      )),
    );
  }
}
