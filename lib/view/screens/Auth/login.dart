import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/AppImage.dart';
import '../../../routs.dart';
import '../../widgets/Custom_Button.dart';
import '../../widgets/Custom_TextFormField.dart';
import '../../../core/functions/requestStatusControl.dart';
import '../../../controller/Auth/auth_Controller.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/functions/validator.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetBuilder<AuthController>(
      builder: (controller) => Scaffold(
          body: ListView(
        children: [
          Form(
            key: controller.loginFormstate,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.020),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: Get.height * 0.020),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          AppImage.logo,
                          width: Get.width - 150,
                        ),
                      ),
                      Custom_TextFormField(
                          validator: (val) {
                            return validator(val!, 6, 30, "email", "");
                          },
                          controller: controller.email,
                          focusNode: controller.focusnode3,
                          prefixImage: AppImage.email,
                          text: "Enter your email"),
                      Custom_TextFormField(
                        obsecure: controller.isShowPassword,
                        validator: (val) {
                          return validator(val!, 8, 16, "password", "");
                        },
                        controller: controller.password,
                        focusNode: controller.focusnode4,
                        prefixImage: AppImage.password,
                        text: "Enter your password",
                        suffix: IconButton(
                            onPressed: () {
                              controller.showPassword();
                            },
                            icon: Image.asset(
                              AppImage.show,
                              color: controller.isShowPassword
                                  ? Colors.grey[600]
                                  : AppColor.primaryColor,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: Get.height * 0.010, left: Get.width / 1.7),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRout.forgetPassword);
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: Get.height * 0.030,
                              right: Get.height * 0.030,
                              top: Get.height * 0.020),
                          child: handlingRequestStatus(
                              statusRequest: controller.statusRequest,
                              widget: Custom_Button(
                                text: "Login",
                                onPressed: () {
                                  // Get.toNamed(AppRout.chatbot);
                                  controller.logIn();
                                  // controller.test();
                                },
                                textcolor: Colors.white,
                                color: AppColor.secondColor,
                              ))),
                      Container(
                          margin: EdgeInsets.only(
                              left: Get.width / 4, top: Get.height * 0.020),
                          child: Row(
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(AppRout.signUP);
                                },
                                child: const Text(
                                  "SignUp",
                                  style: TextStyle(color: AppColor.secondColor),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
