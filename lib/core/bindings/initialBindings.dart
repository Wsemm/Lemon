import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../Repositories/ApiDataRepository.dart';
import '../../controller/Auth/auth_Controller.dart';
import '../../controller/homePage_Controller.dart';
import '../../controller/search_Controller.dart';
import '../cash/cache_helper.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiDataRepository());
    Get.put(SearchController());
    Get.put(homePageController());
    Get.put(Auth_Controller());
  }
}
