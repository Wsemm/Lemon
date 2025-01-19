import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/core/api/api/api_consumer.dart';
import 'package:lemon/core/api/api/dio_consumer.dart';
import 'package:lemon/core/class/statusRequest.dart';
import 'package:lemon/core/functions/Dialog.dart';
import 'package:lemon/model/profile_model.dart';

import '../core/api/api/end_points.dart';
import '../core/api/errors/exspitions.dart';
import '../core/cash/cache_helper.dart';
import '../routs.dart';

class SettingsController extends GetxController {
  ApiConsumer api = DioConsumer(dio: Dio());
  ApiDataRepository repository = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  ProfileModel? profileModel;

  logout() {
    CacheHelper().saveData(key: "step", value: "1");
    Get.offAllNamed(AppRout.login);
  }

  goToUserProfile() {
    if (CacheHelper().getData(key: "step") != "4") {
      Get.toNamed(AppRout.userProfile);
    } else {
      myShowDialog("You Still Guest", "Do you want to SignUp", "Skip", "SignUp",
          () {
            Get.back();
        // Get.offAllNamed(AppRout.signUP);
      }, () {
        // Get.offAllNamed(AppRout.chatbot);
        Get.offAllNamed(AppRout.signUP);
      });
    }
  }

}
