import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/homePage_Controller.dart';
import 'package:lemon/core/constant/AppColor.dart';
import 'package:lemon/core/constant/AppImage.dart';
import 'package:lemon/view/widgets/Store/Custom_ListStores.dart';
import '../../../controller/Auth/auth_Controller.dart';
import '../../../controller/Products/product_controller.dart';
import '../../../routs.dart';
import '../../widgets/Custom_ListProducts.dart';

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
          body: Column(
            children: [
              Container(
                height: Get.height * 0.090,
                // margin: EdgeInsets.only(top: Get.height*0.030),
                color: const Color.fromRGBO(19, 123, 114, 0.8),
                child: Container(
                  margin: EdgeInsets.only(top: Get.height * 0.030),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Delviery to",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.sendNotification();
                                },
                                icon: const Icon(Icons.favorite_border,
                                    color: Colors.white)),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(AppRout.cart);
                                },
                                icon: const Icon(Icons.shopping_cart_outlined,
                                    color: Colors.white))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    if (controller.images.isNotEmpty)
                      Container(
                          decoration: BoxDecoration(
                              color: AppColor.secondColor,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: Get.height / 6.5,
                          margin: EdgeInsets.only(
                            bottom: Get.height * 0.015,
                            left: Get.width * 0.020,
                            right: Get.width * 0.020,
                          ),
                          child: CarouselSlider.builder(
                              itemCount: controller.images.length - 1,
                              itemBuilder: (context, index, realIndex) {
                                final urlimage =
                                    controller.ListImages[index]["image"];
                                return controller.buildimage(
                                  index,
                                );
                              },
                              options: CarouselOptions(
                                aspectRatio: 5,

                                autoPlay: true, // Enable auto play
                                autoPlayInterval: const Duration(
                                    seconds: 3), // Auto play interval
                                autoPlayAnimationDuration: const Duration(
                                    milliseconds: 800), // Animation duration
                                enlargeCenterPage:
                                    true, // Size of the current active page
                                enableInfiniteScroll: true, // Infinite scroll
                                pauseAutoPlayOnTouch: true, // Pause on touch
                              ))),
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
                              (index) => Column(
                                    children: [
                                      Container(
                                        // margin:
                                        //     EdgeInsets.only(right: Get.width * 0.015),
                                        decoration: BoxDecoration(
                                          // color: Colors.grey[400],
                                          // color: const Color.fromRGBO(
                                          //     19, 123, 114, 0.2),
                                          color:
                                              Color.fromRGBO(60, 204, 192, 0.2),

                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: (MaterialButton(
                                          onPressed: () {
                                            switch (index) {
                                              case 0:
                                                controller.repository.filter =
                                                    0;
                                                Get.toNamed(AppRout.stores);
                                                break;
                                              case 1:
                                                break;
                                              case 2:
                                                break;
                                              default:
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    "${controller.mainCategories[index]["iconPath"]}",
                                                height: Get.height / 9,
                                              ),
                                              Container(
                                                // margin:
                                                //     EdgeInsets.only(top: Get.height * 0.010),
                                                child: Text(
                                                    "${controller.mainCategories[index]["name"]}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17)),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                    ],
                                  )),
                        ],
                      ),
                    ),
                    Divider(thickness: 10),
                    if (controller.repository.sections != null)
                      Container(
                        // color: Colors.white,
                        margin: EdgeInsets.only(
                            left: Get.width * 0.020, top: Get.height * 0.015),
                        child: Row(
                          children: [
                            Text(
                              "${controller.repository.sections[2]["title"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    if (controller.repository.sections != null)
                      Container(
                        margin: EdgeInsets.only(
                            top: Get.height * 0.015,
                            left: Get.width * 0.020,
                            right: Get.width * 0.020),
                        width: Get.width - 25,
                        height: Get.height / 4.5,
                        child: ListView.builder(
                          // controller: controller.scrollController,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              controller.repository.sections[2]["items"].length,
                          itemBuilder: (context, index) => Container(
                              width: Get.width / 2,
                              margin: EdgeInsets.only(right: Get.width * 0.015),
                              child: CustomListProducts(
                                  data: controller.repository.sections[2]
                                      ["items"],
                                  index: index)),
                        ),
                      ),
                    Divider(thickness: 10),
                    if (controller.repository.sections != null)
                      Container(
                        margin: EdgeInsets.only(left: Get.width * 0.020),
                        child: Row(
                          children: [
                            Text(
                              "${controller.repository.sections[0]["title"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    if (controller.repository.sections != null)
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.only(
                            left: Get.width * 0.020, right: Get.width * 0.020),
                        width: Get.width - 25,
                        height: Get.height / 4.2,
                        child: ListView.builder(
                          // controller: controller.scrollController,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.repository.sections[0]["items"].length,
                          itemBuilder: (context, index) => Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  print(
                                      "${controller.repository.sections[0]["items"][index]["id"]}");
                                  Get.toNamed(AppRout.storeProfile, arguments: {
                                    "storeId": controller.repository.sections[0]
                                        ["items"][index]["id"],
                                    "details": "filteredStore"
                                  });
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        right: Get.width * 0.015),
                                    child: CustomListStores(
                                        home: 1,
                                        data: controller.repository.sections[0]
                                            ["items"],
                                        index: index)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Divider(thickness: 10),
                    if (controller.searchTextController.text.isNotEmpty)
                      Container(
                        width: 300,
                        height: Get.height - 100,
                        margin: EdgeInsets.only(right: Get.width / 2),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          // controller: controller.scrollController,
                          itemCount: controller.searchData.length,
                          itemBuilder: (context, index) => Container(
                            // margin: EdgeInsets.symmetric(horizontal: Get.width / 4),

                            width: 200,

                            height: Get.height / 4,
                            child: CustomListProducts(
                              data: controller.searchData,
                              index: index,
                            ),
                          ),
                        ),
                      ),
                    if (controller.repository.sections != null)
                      Container(
                        margin: EdgeInsets.only(left: Get.width * 0.020),
                        child: Row(
                          children: [
                            Text(
                              "${controller.repository.sections[1]["title"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    if (controller.repository.sections != null)
                      Container(
                        margin: EdgeInsets.only(
                            left: Get.width * 0.020, right: Get.width * 0.020),
                        width: Get.width - 25,
                        height: Get.height / 4.2,
                        child: ListView.builder(
                          // controller: controller.scrollController,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              controller.repository.sections[1]["items"].length,
                          itemBuilder: (context, index) => Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRout.storeProfile, arguments: {
                                    "storeId": controller.repository.sections[1]
                                        ["items"][index]["id"],
                                    "details": "filteredStore"
                                  });
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        right: Get.width * 0.015),
                                    child: CustomListStores(
                                        home: 1,
                                        data: controller.repository.sections[1]
                                            ["items"],
                                        index: index)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (controller.searchTextController.text.isNotEmpty)
                      Container(
                        width: 300,
                        height: Get.height - 100,
                        margin: EdgeInsets.only(right: Get.width / 2),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          // controller: controller.scrollController,
                          itemCount: controller.searchData.length,
                          itemBuilder: (context, index) => Container(
                            // margin: EdgeInsets.symmetric(horizontal: Get.width / 4),

                            width: 200,

                            height: Get.height / 4,
                            child: CustomListProducts(
                              data: controller.searchData,
                              index: index,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
