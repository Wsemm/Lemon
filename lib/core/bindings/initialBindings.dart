import 'package:get/get.dart';
import 'package:lemon/core/functions/checkTheNetwork.dart';
import '../../Repositories/ApiDataRepository.dart';
import '../../controller/homePage_Controller.dart';
import '../../controller/search_Controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiDataRepository());
    Get.put(SearchController2());
    Get.put(HomePageController());
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
