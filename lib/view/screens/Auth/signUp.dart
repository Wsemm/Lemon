import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/cash/cache_helper.dart';
import '../../../core/constant/AppImage.dart';
import '../../../core/functions/validator.dart';
import '../../../routs.dart';
import '../../widgets/Custom_Button.dart';
import '../../widgets/Custom_TextFormField.dart';
import '../../../controller/Auth/auth_Controller.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/functions/requestStatusControl.dart';

class SignUP extends StatelessWidget {
  const SignUP({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    // Get.put(Auth_Controller(api: DioConsumer(dio: Dio())));

    return GetBuilder<AuthController>(
      builder: (controller) => Scaffold(
          body: Form(
        child: ListView(
          children: [
            Form(
              key: controller.signUpFormstate,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Get.height * 0.020),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            "SingUp",
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
                    // width: 300,
                    // height: 300,
                    margin: EdgeInsets.only(top: Get.height * 0.020),
                    child: Image.asset(
                      AppImage.logo,
                      width: Get.width - 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Custom_TextFormField(
                      validator: (val) {
                        return validator(val!, 6, 30, "email", "");
                      },
                      focusNode: controller.focusnode1,
                      controller: controller.email,
                      prefixImage: AppImage.email,
                      text: "Enter your email"),
                  Custom_TextFormField(
                    obsecure: controller.isShowPassword,
                    validator: (val) {
                      return validator(val!, 8, 16, "password", "");
                    },
                    focusNode: controller.focusnode2,
                    controller: controller.password,
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
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: Get.width * 0.0100,
                                right: Get.width * 0.025),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Checkbox(
                                side: const BorderSide(
                                    strokeAlign: 2, color: Colors.grey),
                                value: false,
                                onChanged: (val) {})),
                        const Text(
                          "I agree to the Lemon",
                          style: TextStyle(fontSize: 16),
                        ),
                        const InkWell(
                          child: Text(
                            " Term of Service ",
                            style: TextStyle(color: AppColor.secondColor),
                          ),
                        ),
                        const Text(" and"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: Get.width * 0.45),
                    child: const InkWell(
                      child: Text(
                        " Privacy Policy",
                        style: TextStyle(color: AppColor.secondColor),
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
                            text: "SignUp",
                            onPressed: () {
                              controller.signUp();
                              // controller.test();
                            },
                            textcolor: Colors.white,
                            color: AppColor.secondColor,
                          ))),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        vertical: 20, horizontal: Get.width / 4.2),
                    child: Row(
                      children: [
                        const Text(
                          "Al ready have account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            // CacheHelper().clearData(key: "step");
                            Get.offNamed(AppRout.login);
                            // controller.pickImage();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: AppColor.secondColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: Get.height * 0.020),
                    child: const Center(
                      child: Text("OR"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Join as ",
                        style: TextStyle(fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(AppRout.homeScreen);
                          CacheHelper().saveData(key: "step", value: "4");
                          // Get.put(ApiDataRepository());
                        },
                        child: const Text(
                          "Guest",
                          style: TextStyle(
                              fontSize: 18, color: AppColor.secondColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
