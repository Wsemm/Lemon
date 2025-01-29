import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Repositories/ApiDataRepository.dart';
import '../../../controller/homePage_Controller.dart';
import '../../../core/constant/AppImage.dart';
import '../../widgets/Custom_ListProducts.dart';

class HomeMade extends StatelessWidget {
  const HomeMade({super.key});

  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    HomePageController controller = Get.find();
    return SafeArea(
        child: Scaffold(
      body: ListView(
        // height: Get.height - 50,
        shrinkWrap: true,

        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              AppImage.homeMade,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Get.height * 0.010,
            ),
            height: Get.height / 1.7,
            child: GridView.builder(
                controller: controller.scrollController2,
                itemCount: repository.productsModel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // crossAxisSpacing: 10,
                    mainAxisExtent: Get.height / 3.6,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(10),
                      child: CustomListProducts(
                          data: repository.productsModel, index: index),
                    )),
          ),
        ],
      ),
    ));
  }
}
