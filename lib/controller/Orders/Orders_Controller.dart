import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../Repositories/ApiDataRepository.dart';
import '../../core/api/api/api_consumer.dart';
import '../../core/api/api/dio_consumer.dart';
import '../../core/class/statusRequest.dart';

class OrdersController extends GetxController {
  ApiConsumer api = DioConsumer(dio: Dio());
  ApiDataRepository repository = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  // getMyOrders() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   try {
  //     final response = await api.get(
  //           EndPoint.myOrders,
  //         ),
  //         statusRequest = StatusRequest.sucess;
  //     Get.snackbar("success", "Login success");
  //     update();
  //   } on ServerException catch (e) {
  //     serverFailuer(statusRequest = StatusRequest.failuer, e.errModel.message);
  //     Get.snackbar("failuer", "{e.errModel.message");
  //   }

  //   update();
  // }

  @override
  void onInit() {
    // getMyOrders();
    super.onInit();
  }
}
