import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Repositories/ApiDataRepository.dart';
import '../core/api/api/api_consumer.dart';
import '../core/api/api/dio_consumer.dart';
import '../core/class/statusRequest.dart';

import '../core/api/api/end_points.dart';
import '../core/api/errors/exspitions.dart';
import '../core/functions/upload_image_toApit.dart';
import '../model/profile_model.dart';
import 'homePage_Controller.dart';

class UserInfoController extends GetxController {
  HomePageController homePagecontroller = Get.find();

  ApiConsumer api = DioConsumer(dio: Dio());
  ApiDataRepository repository = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  ProfileModel? profileModel;
  XFile? image;
  Map payloadData = {};
  late String dob, imageURL;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> formStateAddress = GlobalKey<FormState>();
  late TextEditingController name,
      phoneNumber,
      city,
      date,
      labeTextController,
      detailsTextController,
      areaTextController,
      cityTextController,
      streetTextController,
      phoneNumberTextController;

  List addressinfo = [
    {
      "title": "Label",
      "icon": Icons.label_important_rounded,
    },
    {
      "title": "details",
      "icon": Icons.details_outlined,
    },
    {
      "title": "area",
      "icon": Icons.area_chart,
    },
    {
      "title": "city",
      "icon": Icons.store_mall_directory_rounded,
    },
    {
      "title": "street",
      "street": Icons.streetview,
    },
    {
      "title": "phone Number",
      "street": Icons.phone,
    },
  ];

  PatchPersonalInfo() async {
    if (formState.currentState!.validate()) {
      if (name.text.isNotEmpty) {
        payloadData.addAll({"name": name.text});
      } else {
        payloadData.remove("name");
      }
      if (phoneNumber.text.isNotEmpty) {
        payloadData.addAll({"phoneNumber": phoneNumber.text});
      } else {
        payloadData.remove("phoneNumber");
      }
      if (city.text.isNotEmpty) {
        payloadData.addAll({"city": city.text});
      } else {
        payloadData.remove("city");
      }
      if (dob.isNotEmpty) {
        payloadData.addAll({"dob": dob});
      } else {
        payloadData.remove("dob");
      }
      if (image != null) {
        payloadData.addAll({"avatarURL": imageURL});
      } else {
        payloadData.remove("avatarURL");
      }

      statusRequest = StatusRequest.loading;
      update();

      try {
        final response =
            await api.patch(EndPoint.updateProfile, data: payloadData
                // {
                //   "name": name.text,
                //   "phoneNumber": phoneNumber.text,
                //   "city": city.text,
                //   "dob": dob,
                //   "avatarURL": image != null ? imageURL : null,
                // }

                );
        profileModel = ProfileModel.fromJson(response);
        repository.saveData(ProfileModel, profileModel);
        statusRequest = StatusRequest.sucess;
        Get.snackbar("success", "profile updated successfully");
        name.clear();
        phoneNumber.clear();
        city.clear();
        date.clear();
        homePagecontroller.update();
        update();
      } on ServerException catch (e) {
        statusRequest = StatusRequest.failuer;
        update();
        // serverFailuer(
        //     statusRequest = StatusRequest.failuer, e.errModel.message);
        Get.snackbar("failuer", "${e.errModel.message}");
      }
    }
  }

  selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null) {
      DateTime utcDateTime = picked.toUtc();
      // Format to ISO 8601 with milliseconds
      dob =
          "${utcDateTime.toIso8601String().split('.').first}.${(utcDateTime.millisecond).toString().padLeft(3, '0')}Z";
      date.text = picked.toString().split(" ")[0];

      update();
    }
  }

  uploadImage() async {
    {
      try {
        statusRequest = StatusRequest.loading;
        update();
        final response =
            await api.post(isFromData: true, EndPoint.uploadImage, data: {
          "folderName": "user",
          "fileName": "test new2",
          "file": await uploadImageToAPI(image!),
        });
        imageURL = response["path"];

        statusRequest = StatusRequest.sucess;
        update();
      } on ServerException catch (e) {
        serverFailuer(
            statusRequest = StatusRequest.failuer, e.errModel.message);
        Get.snackbar("failuer", e.errModel.message[0]);
        update();
      }
    }
  }

  pickImage() async {
    ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      image = value;
      uploadImage();
    });

    update();
  }

  initialTextController() {
    labeTextController = TextEditingController();
    detailsTextController = TextEditingController();
    areaTextController = TextEditingController();
    cityTextController = TextEditingController();
    streetTextController = TextEditingController();
    phoneNumberTextController = TextEditingController();
    name = TextEditingController();
    phoneNumber = TextEditingController();
    city = TextEditingController();
    date = TextEditingController();
    dob = "";
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.post(EndPoint.addAddress, data: {
        "label": labeTextController.text,
        "details": detailsTextController.text,
        "area": areaTextController.text,
        "city": cityTextController.text,
        "street": streetTextController.text,
        "phoneNumber": phoneNumberTextController.text
      });

      statusRequest = StatusRequest.sucess;
      Get.snackbar("success", "Login success");
      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar("failuer", "${e.errModel.message}");
    }

    update();
  }

  @override
  void onInit() {
    initialTextController();

    super.onInit();
  }
}
