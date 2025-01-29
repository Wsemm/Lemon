import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/Auth/auth_Controller.dart';
import '../../../core/class/statusRequest.dart';
import '../../../core/functions/validator.dart';
import '../../../core/constant/AppColor.dart';
import '../../widgets/Custom_TextFormField2.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return SafeArea(
        child: GetBuilder<AuthController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("My Profile")),
        ),
        body: Form(
          key: controller.profileFormstate,
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: Get.width,
                            height: Get.height / 8,
                            color: Colors.grey[350],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: Get.height * 0.040,
                            ),
                            // width: Get.width / 2,
                            // height: Get.height / 6,
                            child: controller.image == null
                                ? Container(
                                    margin:
                                        EdgeInsets.only(left: Get.width * 0.25),
                                    width: Get.width / 2,
                                    height: Get.height / 6,
                                    child: CircleAvatar(
                                        backgroundColor: AppColor.primaryColor,
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: Get.width / 7,
                                        )

                                        // CachedNetworkImage(
                                        //     imageUrl: controller.image.toString())

                                        ),
                                  )
                                : Container(
                                    margin:
                                        EdgeInsets.only(left: Get.width * 0.33),
                                    child: ClipOval(
                                      child: Image.file(
                                        File(controller.image!.path),
                                        height: Get.height / 6,
                                        width: Get.width / 3,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Get.width / 1.8, top: Get.height / 6),
                            child: controller.image == null
                                ? CircleAvatar(
                                    child: IconButton(
                                        onPressed: () async {
                                          controller.pickImage();
                                          // await controller.uploadImage();
                                        },
                                        icon: const Icon(
                                            Icons.camera_alt_outlined)),
                                  )
                                : null,
                          )
                        ],
                      )
                    ],
                  ),
                  CustomTextFormField(
                      validator: (val) {
                        return validator(val!, 1, 30, "name", "");
                      },
                      controller: controller.name,
                      prefix: Icons.person,
                      text: "Enter your Name"),
                  CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        return validator(val!, 10, 10, "phone", "");
                      },
                      controller: controller.phoneNumber,
                      prefix: Icons.phone,
                      text: "Enter your phone Number"),
                  CustomTextFormField(
                      validator: (val) {
                        return validator(val!, 1, 15, "city", "");
                      },
                      controller: controller.city,
                      prefix: Icons.location_city,
                      text: "Enter your City"),
                  CustomTextFormField(
                      validator: (val) {
                        return validator(val!, 1, 30, "date", "");
                      },
                      readOnly: true,
                      onTap: () {
                        controller.selectDate(context);
                      },
                      controller: controller.date,
                      prefix: Icons.calendar_month,
                      text: "Enter your Date of birth"),
                  controller.statusRequest == StatusRequest.loading
                      ? Container(
                          margin: EdgeInsets.only(
                              top: Get.height * 0.18,
                              left: Get.width * 0.020,
                              right: Get.width * 0.020),
                          child: const CircularProgressIndicator())
                      : Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              top: Get.height * 0.18,
                              left: Get.width * 0.020,
                              right: Get.width * 0.020),
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
                                controller.PatchPersonalInfo();
                              },
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
