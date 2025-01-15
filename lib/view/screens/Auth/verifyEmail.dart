import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/Auth/auth_Controller.dart';
import 'package:lemon/core/class/statusRequest.dart';
import 'package:lemon/view/widgets/Custom_Button.dart';

import '../../../core/constant/AppColor.dart';
import '../../../core/functions/validator.dart';
import '../../widgets/Auth/Custom_Otp.dart';
import '../../widgets/Custom_TextFormField2.dart';

class verifyEmail extends StatelessWidget {
  const verifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Auth_Controller controller = Get.put(Auth_Controller());
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.primaryColor,
            body: ListView(
              children: [
                GetBuilder<Auth_Controller>(
                  builder: (controller) => Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: Get.height * 0.010),
                        child: (Text(
                          "Verify Your Email",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: controller.changePassword == true
                              ? Get.height * 0.050
                              : Get.height / 5,
                        ),
                        child: (Text(
                          "please Enter  the code  you recived",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )),
                      ),
                      Container(
                          // margin: EdgeInsets.only(top: Get.height/5),
                          child: CustomOtpTextField(onSubmit: (value) {
                        if (controller.changePassword == false) {
                          controller.verifyEmail(value);
                        } else {
                          controller.otp = value;
                          controller.update();
                        }
                      })),
                      if (controller.statusRequest == StatusRequest.loading)
                        Container(
                          margin: EdgeInsets.only(top: Get.height * 0.020),
                          child: CircularProgressIndicator(
                            color: AppColor.secondColor,
                          ),
                        ),
                      if (controller.changePassword == true)
                        Form(
                          key: controller.PrFormstate,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                  validator: (val) {
                                    return validator(
                                        val!,
                                        8,
                                        20,
                                        "PasswordReset",
                                        controller.RePasswordReset.text);
                                  },
                                  controller: controller.PasswordReset,
                                  prefix: Icons.password,
                                  text: "Enter your new password"),
                              CustomTextFormField(
                                  validator: (val) {
                                    return validator(
                                        val!,
                                        8,
                                        20,
                                        "PasswordReset",
                                        controller.PasswordReset.text);
                                  },
                                  controller: controller.RePasswordReset,
                                  prefix: Icons.password,
                                  text: "ReEnter your password"),
                              Container(
                                margin:
                                    EdgeInsets.only(top: Get.height * 0.020),
                                decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    controller.resetPassword(controller.otp);
                                  },
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(top: Get.height * 0.020),
                        // decoration: BoxDecoration(
                        //     color: AppColor.secondColor,
                        //     borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          color: AppColor.secondColor,
                          shape: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.secondColor),
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            controller.isButtonDisabled.isFalse
                                ? controller.changePassword
                                    ? controller.forgetPassword()
                                    : controller.sendEmail()
                                : null;
                          },
                          child: Text(
                            controller.isButtonDisabled.isTrue
                                ? 'Try again in  ${controller.countdownTime.value}s'
                                : 'Resend Verification Code',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
