import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Repositories/ApiDataRepository.dart';
import '../../controller/userInfo_Controller.dart';
import '../../core/constant/AppImage.dart';

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
                                          ? Hero(
                                              tag: "profilePic",
                                              child: ClipOval(
                                                child: Image.asset(
                                                  AppImage.user,
                                                  height: Get.height / 7,
                                                  width: Get.width / 3,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : Hero(
                                              tag: "profilePic",
                                              child: ClipOval(
                                                child: Image.file(
                                                  File(controller.image!.path),
                                                  height: Get.height / 7,
                                                  width: Get.width / 3,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                      : Hero(
                                          tag: "profilePic",
                                          child: ClipOval(
                                            child: CachedNetworkImage(
                                              imageUrl: repository
                                                  .profileModel.avatarUrl!,
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                              // Set the width and height for the circular image
                                              height: Get.height / 7,
                                              width: Get.width / 3,
                                              fit: BoxFit.cover,
                                            ),
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
