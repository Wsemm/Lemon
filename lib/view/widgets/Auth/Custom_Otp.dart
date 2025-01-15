import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../core/constant/AppColor.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({super.key, required this.onSubmit});
  final void Function(String) onSubmit;
  @override
  Widget build(BuildContext context) {
    // VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());

    return OtpTextField(
        // enabledBorderColor: Colors.red,
        textStyle: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        focusedBorderColor: AppColor.secondColor,
        fieldWidth: Get.width * 0.13,
        borderRadius: BorderRadius.circular(20),
        numberOfFields: 6,
        showFieldAsBox: true,
        onCodeChanged: (String code) {},
        onSubmit: onSubmit

        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         title: Text("verification Code"),
        //         content: Text("Code entred is $VerificationCode"),
        //       );
        //     });

        );
  }
}
