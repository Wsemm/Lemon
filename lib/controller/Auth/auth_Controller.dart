import 'dart:async';
import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../homePage_Controller.dart';
import '../../core/api/api/api_consumer.dart';
import '../../core/api/api/dio_consumer.dart';
import '../../core/api/api/end_points.dart';
import '../../core/api/errors/exspitions.dart';
import '../../core/class/statusRequest.dart';
import '../../Repositories/ApiDataRepository.dart';
import '../../core/functions/Dialog.dart';
import '../../core/functions/upload_image_toApit.dart';
import '../../model/profile_model.dart';
import '../../core/cash/cache_helper.dart';
import '../../core/constant/AppColor.dart';
import '../../model/login_model.dart';
import '../../model/sign_up_model.dart';
import '../../routs.dart';
import '../ChatBot/chatBot_Controller.dart';

class AuthController extends GetxController {
  // final ApiConsumer api;
  // Auth_Controller({required this.api});
  ChatBotController chatBotController = Get.put(ChatBotController());
  ApiDataRepository repository = Get.find();
  ApiConsumer api = DioConsumer(dio: Dio());
  //================ Global Keys ================
  GlobalKey<FormState> signUpFormstate = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormstate = GlobalKey<FormState>();
  GlobalKey<FormState> profileFormstate = GlobalKey<FormState>();
  GlobalKey<FormState> PrFormstate = GlobalKey<FormState>();
  //================ Models ================
  SignUpModel? signUpModel;
  LoginModel? loginModel;
  ProfileModel? profileModel;

  FocusNode focusnode1 = FocusNode();
  FocusNode focusnode2 = FocusNode();
  FocusNode focusnode3 = FocusNode();
  FocusNode focusnode4 = FocusNode();
  //================ Vars ================
  String message = "s", otp = "0";
  XFile? image;
  bool isShowPassword = true, changePassword = false;
  Timer? timer;
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email,
      password,
      name,
      phoneNumber,
      city,
      date,
      PasswordReset,
      RePasswordReset;
  var isButtonDisabled = false.obs;
  var countdownTime = 60.obs;
  late String imageURL;
  late String date2;
  HomePageController homePageController = Get.find();

  // final firebaseMessaging = FirebaseMessaging.instance;

  signUp() async {
    if (signUpFormstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      try {
        final response = await api.post(EndPoint.register, data: {
          "email": email.text,
          "password": password.text,
        });
        signUpModel = SignUpModel.fromJson(response);
        repository.saveData(SignUpModel, signUpModel);
        statusRequest = StatusRequest.sucess;
        Get.snackbar("SignUp success",
            "please login to send verify code to  your email");
        Get.toNamed(AppRout.login);
        CacheHelper().saveData(key: "step", value: "1");

        update();
      } on ServerException catch (e) {
        serverFailuer(
            statusRequest = StatusRequest.failuer, e.errModel.message);
        Get.snackbar("failuer", e.errModel.message);
        message = e.errModel.message;
        update();
      }
    }
  }

  logIn() async {
    if (loginFormstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      try {
        final response = await api.post(EndPoint.login, data: {
          "email": email.text,
          "password": password.text,
        });
        loginModel = LoginModel.fromJson(response);
        repository.saveData(LoginModel, loginModel);

        CacheHelper()
            .saveData(key: ApiKey.accessToken, value: loginModel!.accessToken);
        CacheHelper().saveData(
            key: ApiKey.refreshToken, value: loginModel!.refreshToken);
        statusRequest = StatusRequest.sucess;
        if (loginModel!.user!.verifiedAt == null) {
          sendEmail();
        } else {
          CacheHelper().saveData(key: "step", value: "3");
          Get.offAllNamed(AppRout.homeScreen);
          Get.snackbar("welcome", " ");
          homePageController.getPersonalInfo();
        }
        update();
      } on ServerException catch (e) {
        serverFailuer(
            statusRequest = StatusRequest.failuer, e.errModel.message);
        // Get.snackbar("failuer", "${e.errModel.message}");
        Get.snackbar("", "",
            barBlur: 1,
            backgroundColor: AppColor.primaryColor,
            backgroundGradient: const LinearGradient(
                colors: [AppColor.primaryColor, AppColor.secondColor]),
            titleText: const Text(
              "failuer",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            messageText: Text(
              e.errModel.message,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ));

        update();
      }
    }
  }

  sendEmail() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.post(EndPoint.sendEmail, data: {
        "email": "${repository.loginData.user!.email}",
      });

      statusRequest = StatusRequest.sucess;
      Get.snackbar("success",
          "a verify code sent for ${repository.loginData.user!.email}");
      Get.offAllNamed(AppRout.verifyEmail);
      update();
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      startTimer();
      Get.snackbar("failuer", e.errModel.message);
      update();
    }

    update();
  }

  verifyEmail(otp) async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.post(EndPoint.verifyEmail,
          data: {"email": "${repository.loginData.user!.email}", "otp": otp});

      statusRequest = StatusRequest.sucess;
      Get.snackbar("success", "your email has been activated");
      CacheHelper().saveData(key: "step", value: "2");
      update();
      Get.offAllNamed(AppRout.profileInfo);
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar("failuer", e.errModel.message);
    }

    update();
  }

  PatchPersonalInfo() async {
    if (profileFormstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      try {
        final response = await api.patch(EndPoint.updateProfile, data: {
          "name": name.text,
          "phoneNumber": phoneNumber.text,
          "city": city.text,
          "dob": date2,
          "avatarURL": image != null ? imageURL : null,
        });
        // print(
        //     "======================${repository.profileModel.gender}======================");
        profileModel = ProfileModel.fromJson(response);
        repository.saveData(ProfileModel, profileModel);

        statusRequest = StatusRequest.sucess;
        Get.snackbar("success", "profile updated successfully");
        myShowDialog(
            "add more info",
            "do you want to give us some information about your body, it helps us to give you the best answers and products",
            "Skip",
            "yes", () {
          Get.offAllNamed(AppRout.homeScreen);
        }, () {
          Get.offAllNamed(AppRout.chatbot);
        });
        // Get.offAllNamed(AppRout.homePage);
        CacheHelper().saveData(key: "step", value: "3");
        update();
      } on ServerException catch (e) {
        statusRequest = StatusRequest.failuer;
        update();
        // serverFailuer(
        //     statusRequest = StatusRequest.failuer, e.errModel.message);
        Get.snackbar("failuer", "${e.errModel.message}");
      }

      update();
    }
  }

  PatchPhysicalInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await api.patch(EndPoint.updateProfile, data: {
        "physicalAttributes": {
          "height": int.parse(chatBotController.answers[0]),
          "weight": int.parse(chatBotController.answers[1]),
          "chronicDiseases": chatBotController.answers[6],
          "gender": chatBotController.answers[8].toUpperCase(),
          "skinColor": chatBotController.answers[9].toUpperCase(),
          "hairColor": chatBotController.answers[11].toUpperCase(),
          "skinType": chatBotController.answers[10].toUpperCase(),
          "hairType": chatBotController.answers[12].toUpperCase(),
          "makeupFavColor": chatBotController.answers[7].toUpperCase(),
          "dailyNutritional": {
            "calories": int.parse(chatBotController.answers[2]),
            "carbs": int.parse(chatBotController.answers[3]),
            "fat": int.parse(chatBotController.answers[4]),
            "protein": int.parse(chatBotController.answers[5])
          }
        }
      });

      profileModel = ProfileModel.fromJson(response);
      repository.saveData(ProfileModel, profileModel);

      statusRequest = StatusRequest.sucess;
      Get.snackbar("success", "profile updated successfully");

      Get.offAllNamed(AppRout.homeScreen);
      update();
      // } on ServerException catch (e) {
    } on ServerException catch (e) {
      serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
      Get.snackbar(e.errModel.message, e.errModel.message,
          messageText: Text(
            e.errModel.message,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ));
    }

    update();
  }

  uploadImage() async {
    {
      try {
        statusRequest = StatusRequest.loading;
        update();
        final response =
            await api.post(isFromData: true, EndPoint.uploadImage, data: {
          "folderName": "profile2",
          "fileName": "test new2",
          "file": await uploadImageToAPI(image!),
        });
        imageURL = response["path"];

        statusRequest = StatusRequest.sucess;
        update();
      } on ServerException catch (e) {
        serverFailuer(
            statusRequest = StatusRequest.failuer, e.errModel.message);
        Get.snackbar("failuer", e.errModel.message);
        update();
        // TODO
      }
    }
  }

//   Timer to resend verifycation code
  void startTimer() {
    if (isButtonDisabled.isTrue) {
      return; // Prevent starting a new timer if one is already running
    }
    isButtonDisabled.value = true;
    countdownTime.value = 60;
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      // update();
      if (countdownTime.value == 0) {
        timer.cancel();
        isButtonDisabled.value = false; // Enable the button again
      } else {
        countdownTime.value--;
        print(countdownTime.value);
        update();
      }
      update();
    });
  }

  pickImage() async {
    ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      image = value;
      uploadImage();
    });

    update();
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
      date2 =
          "${utcDateTime.toIso8601String().split('.').first}.${(utcDateTime.millisecond).toString().padLeft(3, '0')}Z";

      date.text = picked.toString().split(" ")[0];
      update();
    }
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  forgetPassword() async {
    statusRequest = StatusRequest.loading;

    update();
    try {
      final response =
          await api.post(EndPoint.forgetPassword, data: {"email": email.text});

      statusRequest = StatusRequest.sucess;
      // sendEmail();
      changePassword = true;
      // await api.post(EndPoint.sendEmail, data: {
      //   "email": email.text,
      // });
      Get.offNamed(AppRout.verifyEmail);

      update();
    } on ServerException catch (e) {
      serverFailuer(
          statusRequest = StatusRequest.failuer, e.errModel.message[0]);

      Get.snackbar("failuer", "${e.errModel.message[0]}");
    }

    update();
  }

  resetPassword(otp) async {
    if (PrFormstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      try {
        final response = await api.post(EndPoint.resetPassword,
            data: {"otp": otp, "newPassword": PasswordReset.text});
        // loginModel = LoginModel.fromJson(response);
        // repository.saveData(LoginModel, loginModel);

        statusRequest = StatusRequest.sucess;
        Get.snackbar("success", "your password has successfully reset");
        Get.offAllNamed(AppRout.login);
        changePassword = true;
        update();
      } on ServerException catch (e) {
        serverFailuer(
            statusRequest = StatusRequest.failuer, e.errModel.message);
        Get.snackbar("failuer", e.errModel.message);
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    phoneNumber = TextEditingController();
    city = TextEditingController();
    date = TextEditingController();
    PasswordReset = TextEditingController();
    RePasswordReset = TextEditingController();
    // test();

    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel(); // Cancel the timer when the controller is disposed
    super.onClose();
  }
}
