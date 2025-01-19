import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/controller/userInfo_Controller.dart';
import 'package:lemon/core/constant/AppImage.dart';

import '../../controller/Auth/auth_Controller.dart';
import '../../core/class/statusRequest.dart';
import '../../core/constant/AppColor.dart';
import '../../core/functions/validator.dart';
import '../widgets/Custom_TextFormField2.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfoController controller = Get.put(UserInfoController());
    ApiDataRepository repository = Get.find();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(children: [
        GetBuilder<UserInfoController>(
          builder: (controller) => Form(
            key: controller.formState,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: Get.height * 0.95,
                  child: Column(
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
                              GestureDetector(
                                onTap: () {
                                  controller.pickImage();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: Get.height * 0.030,
                                      left: Get.width * 0.040),
                                  child: repository.profileModel.avatarUrl ==
                                          null
                                      ? controller.image == null
                                          ? const Hero(
                                              tag: "profilePic",
                                              child: CircleAvatar(
                                                maxRadius: 55,
                                                backgroundImage:
                                                    AssetImage(AppImage.user),
                                              ),
                                            )
                                          : Hero(
                                              tag: "profilePic",
                                              child: CircleAvatar(
                                                maxRadius: 55,
                                                backgroundImage: FileImage(File(
                                                    controller.image!.path)),
                                              ),
                                            )
                                      : Hero(
                                          tag: "profilePic",
                                          child: CircleAvatar(
                                            maxRadius: 55,
                                            backgroundImage: NetworkImage(
                                                repository
                                                    .profileModel.avatarUrl!),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      CustomTextFormField(
                          validator: (val) {
                            return validatorEmptyAllow(val!, 0, 15, "name", "");
                          },
                          controller: controller.name,
                          prefix: Icons.person,
                          text: repository.profileModel.name != null
                              ? "${repository.profileModel.name}"
                              : "Enter your Name"),
                      CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            return validatorEmptyAllow(
                                val!, 0, 10, "phone", "");
                          },
                          controller: controller.phoneNumber,
                          prefix: Icons.phone,
                          text: repository.profileModel.phoneNumber != null
                              ? "${repository.profileModel.phoneNumber}"
                              : "Enter your phone Number"),
                      CustomTextFormField(
                          validator: (val) {
                            return validatorEmptyAllow(val!, 0, 15, "city", "");
                          },
                          controller: controller.city,
                          prefix: Icons.location_city,
                          text: repository.profileModel.city != null
                              ? "${repository.profileModel.city}"
                              : "Enter your City"),
                      CustomTextFormField(
                          // validator: (val) {
                          //   return validatorEmptyAllow(val!, 2, 30, "date", "");
                          // },
                          readOnly: true,
                          onTap: () {
                            controller.selectDate(context);
                          },
                          controller: controller.date,
                          prefix: Icons.calendar_month,
                          text: repository.profileModel.dob != null
                              ? "${repository.profileModel.dob}"
                              : "Enter your Date of birth"),
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
                                  top: Get.height * 0.17,
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
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
