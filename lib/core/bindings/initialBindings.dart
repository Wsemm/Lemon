import 'package:get/get.dart';
import '../../Repositories/ApiDataRepository.dart';
import '../../controller/homePage_Controller.dart';
import '../../controller/search_Controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiDataRepository());
    Get.put(SearchController());
    Get.put(HomePageController());
  }
}
