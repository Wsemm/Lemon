import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/Auth/auth_Controller.dart';
import 'package:lemon/view/widgets/Custom_TextFormField2.dart';

import '../../../core/constant/AppColor.dart';
import '../../../core/functions/validator.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Auth_Controller controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset password"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Get.height * 0.02,
                left: Get.width * 0.030,
                right: Get.width * 0.030),
            child: CustomTextFormField(
                validator: (val) {
                  return validator(val!, 7, 20, "email", "");
                },
                controller: controller.email,
                prefix: Icons.email_outlined,
                text: "Enter your Email"),
          ),
          Container(
            width: Get.width - 100,
            // margin: EdgeInsets.only(top: Get.height/2),
            margin: EdgeInsets.only(top: Get.height * 0.020),

            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColor.secondColor,
                    AppColor.primaryColor,
                    Colors.blueGrey
                  ],
                ),
                borderRadius: BorderRadius.circular(20)),
            child: MaterialButton(
              onPressed: () {
                controller.forgetPassword();
              },
              child: Text("Send"),
            ),
          )
        ],
      ),
    );
  }
}
