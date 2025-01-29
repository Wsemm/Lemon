import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/homePage_Controller.dart';
import '../../widgets/homePage/appBar.dart';
import '../../widgets/homePage/homePage_Sections.dart';
import '../../widgets/homePage/mainCategories.dart';
import '../../widgets/homePage/sliders_Images.dart';
import '../../../controller/Products/product_controller.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(fenix: true, () => ProductDetailsController());
    HomePageController homePageController = Get.find();

    // Get.put(Auth_Controller());
    // ChatBotController chatBot_Controller = Get.put(ChatBotController());
    return GetBuilder<HomePageController>(
      builder: (controller) => Scaffold(
          backgroundColor: Colors.grey[300],
          body: Stack(
            children: [
              Column(
                children: [
                  const HomePageAppBar(),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        if (controller.slidersImages.isNotEmpty)
                          SlidersImages(imageList: controller.slidersImages),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: Get.height * 0.015,
                              right: Get.width * 0.020,
                              left: Get.width * 0.020),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(
                                  controller.mainCategories.length,
                                  (index) => Maincategories(
                                      index: index,
                                      filter: controller.repository.filter,
                                      mainCategoriesList:
                                          controller.mainCategories)),
                            ],
                          ),
                        ),
                        const Divider(thickness: 10),
                        if (controller.repository.sections != null)
                          Column(
                            children: [
                              HomePageProductSection(
                                  sections: controller.repository.sections),
                              const Divider(thickness: 10),
                              HomePageStoreSpecialOffersSection(
                                  listIndex: 0,
                                  section: controller.repository.sections),
                              const Divider(thickness: 10),
                              HomePageStoreSpecialOffersSection(
                                  listIndex: 1,
                                  section: controller.repository.sections)
                            ],
                          )
                      ],
                    ),
                  ),
                ],
              ),
              //    Animated Container
              // Obx(
              //   () => AnimatedPositioned(
              //     duration: Duration(milliseconds: 300),
              //     bottom: controller.isExpanded.value
              //         ? 0
              //         : -MediaQuery.of(context).size.height * 0.75,
              //     left: 0,
              //     right: 0,
              //     child: GestureDetector(
              //       onPanUpdate: (details) {
              //         if (controller.isExpanded.value) {
              //           // Dragging the container
              //           final newBottom = details.delta.dy +
              //               MediaQuery.of(context).size.height * 0.75;
              //           if (newBottom >= 0 &&
              //               newBottom <=
              //                   MediaQuery.of(context).size.height * 0.75) {
              //             controller.isExpanded.value = true;
              //             // Move the container
              //             // Note: Adjust this part based on your requirements
              //             double bottom =
              //                 MediaQuery.of(context).size.height * 0.75 -
              //                     newBottom;
              //             controller.isExpanded.value = bottom <
              //                 MediaQuery.of(context).size.height * 0.75;
              //           }
              //         }
              //       },
              //       onTap: () {
              //         controller.isExpanded.value =
              //             !controller.isExpanded.value;
              //       },
              //       child: Container(
              //         height: MediaQuery.of(context).size.height * 0.75,
              //         color: Colors.blue,
              //         child: Center(
              //             child: Text('Drag Me Up',
              //                 style: TextStyle(
              //                     color: Colors.white, fontSize: 24))),
              //       ),
              //     ),
              //   ),
              // )
            ],
          )),
    );
  }
}
