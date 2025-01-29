import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Repositories/ApiDataRepository.dart';
import '../../../model/stores_model.dart';
import '../../../controller/Stores/storeProfile_Controller.dart';
import '../../widgets/Store/StoreProfile.dart';

class StoreProfile extends StatelessWidget {
  const StoreProfile({super.key});

  @override
  Widget build(BuildContext context) {
    StoreProfileController controller = Get.put(StoreProfileController());
    ApiDataRepository repository = Get.find();
    StoresModel storesModel = StoresModel();
    return Scaffold(
        backgroundColor: Colors.grey[350],
        body: GetBuilder<StoreProfileController>(
          builder: (controller) => CustomStoreProfile(
              storeData: repository.storesModel,
              storeProductData: repository.storeProducts,
              scrollController: controller.scrollController,
              statusRequest: controller.statusRequest,
              resevedData: controller.details,
              controllerIndex: controller.storeId,
              newData: repository.searchStoreInfoData,
              newData2: repository.test),
        ));
  }
}
