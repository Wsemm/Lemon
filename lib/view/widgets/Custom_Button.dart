import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/AppColor.dart';

class Custom_Button extends StatelessWidget {
  final Color? color, textcolor;
  final String text;
  final Function() onPressed;
  const Custom_Button(
      {super.key,
      this.color,
      this.textcolor,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.070,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textcolor),
        ),
      ),
    );
  }
}

class Custom_ButtonAuth extends StatelessWidget {
  const Custom_ButtonAuth(
      {super.key, this.image, required this.text, this.prefixIcon});
  final String? image;
  final String text;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.060),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          children: [
            Container(child: prefixIcon),
            Container(
              margin: EdgeInsets.only(left: Get.width / 8),
              child: Text(
                text,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
