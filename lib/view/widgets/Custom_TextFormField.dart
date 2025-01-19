import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/Auth/auth_Controller.dart';
import 'package:lemon/core/functions/validator.dart';

import '../../core/constant/AppColor.dart';

class Custom_TextFormField extends StatelessWidget {
  const Custom_TextFormField({
    super.key,
    required this.prefixImage,
    required this.text,
    this.suffix,
    this.controller,
    this.focusNode,
    this.validator,
    this.obsecure,
  });
  final String prefixImage, text;
  final Widget? suffix;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool? obsecure;

  @override
  Widget build(BuildContext context) {
    Auth_Controller authController = Get.put(Auth_Controller());
    RxBool isFocused = false.obs;

    focusNode!.addListener(() {
      authController.update();
    });

    // Auth_Controller authController = Get.find();

    return Column(children: [
      Container(
        margin: EdgeInsets.only(
          left: Get.width * 0.040,
          right: Get.width * 0.040,
          top: Get.height * 0.020,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 245, 245, 245)),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          obscureText: obsecure == null || obsecure == false ? false : true,
          validator: validator,
          focusNode: focusNode,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColor.secondColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: Image.asset(prefixImage,
                color: focusNode!.hasFocus ? AppColor.primaryColor : null),
            suffixIcon: suffix,
            labelStyle: TextStyle(color: Colors.grey[500]),
            labelText: text,
          ),
        ),
      )
    ]);
  }
}


// TextFormField(
//             focusNode: focusNode,
//             controller: controller,
//             decoration: InputDecoration(
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(color: AppColor.secondColor),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               prefixIcon: Image.asset(prefixImage,
//                   color: focusNode != null
//                       ? focusNode!.hasFocus
//                           ? AppColor.primaryColor
//                           : Colors.grey
//                       : null),
//               suffixIcon: suffix,
//               labelStyle: TextStyle(color: Colors.grey[500]),
//               labelText: text,
//             ),
        
//           )