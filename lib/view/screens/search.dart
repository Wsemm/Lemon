import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/search_Controller.dart';
import 'package:lemon/core/class/statusRequest.dart';
import 'package:lemon/view/widgets/Custom_ListProducts.dart';
import '../../core/constant/AppColor.dart';
import '../../routs.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    SearchController controller = Get.put(SearchController());
    return SafeArea(
      child: GetBuilder<SearchController>(
        builder: (controller) => Scaffold(
          backgroundColor: Colors.grey[200],
          body: Column(
            children: [
              // Search Top Text Field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: AppColor.primaryColor
                ),
                margin: EdgeInsets.symmetric(
                  vertical: Get.height * 0.020,
                  horizontal: Get.width * 0.040,
                ),
                width: Get.width,
                height: Get.height * 0.060,
                child: TextFormField(
                  onChanged: (Value) {
                    if (controller.searchTextController.text.isEmpty) {
                      controller.searchData.clear();
                      controller.searchStoreData.clear();
                      controller.update();
                    } else {
                      if (Value.length > controller.previousValue.length) {
                        // User is deleting
                        controller.onSearchChanged();
                      }
                    }

                    controller.previousValue = Value;
                  },
                  controller: controller.searchTextController,
                  decoration: InputDecoration(
                      prefixIcon: Container(
                        child: IconButton(
                            onPressed: () {
                              controller.searchHistoryProducts = 0;
                              controller.searchHistoryStores = 0;

                              controller.getSearchProducts();
                            },
                            icon: const Icon(
                              Icons.search,
                            )),
                      ),
                      suffixIcon: SizedBox(
                        // margin: EdgeInsets.only(right: Get.width * 0.2),
                        width: 85,

                        child: IconButton(
                            onPressed: () {
                              controller.searchData.clear();
                              controller.searchStoreData.clear();

                              controller.searchTextController.clear();

                              controller.update();
                            },
                            icon: Row(
                              children: [
                                Text(
                                  "clear",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 18),
                                ),
                                const Icon(Icons.delete_outline),
                              ],
                            )),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              // End Search Top Text Field

              // filter Bar
              Container(
                // color: Colors.grey[400],
                color: AppColor.secondColor,
                height: Get.height * 0.050,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // decoration: UnderlineTabIndicator(
                      //     borderSide: BorderSide(
                      //         color: controller.currentPage == 0
                      //             ? AppColor.primaryColor
                      //             : Colors.white)),
                      child: InkWell(
                        onTap: () {
                          controller.next(0);
                        },
                        child: Text(
                          "docotrs",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: controller.currentPage == 0
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // decoration: UnderlineTabIndicator(
                      //     borderSide: BorderSide(
                      //         color: controller.currentPage == 1
                      //             ? AppColor.primaryColor
                      //             : Colors.white)),
                      child: InkWell(
                        onTap: () {
                          controller.next(1);
                        },
                        child: Text(
                          "Stores",
                          style: TextStyle(
                              color: controller.currentPage == 1
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      // decoration: UnderlineTabIndicator(
                      //     borderSide: BorderSide(
                      //         color: controller.currentPage == 2
                      //             ? AppColor.primaryColor
                      //             : Colors.white)),
                      child: InkWell(
                        onTap: () {
                          controller.next(2);
                        },
                        child: Text(
                          "Products",
                          style: TextStyle(
                              color: controller.currentPage == 2
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Endfilter Bar

              // page view of items

              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: Get.height * 0.020,
                      horizontal: Get.width * 0.020,
                    ),
                    width: Get.width,
                    height: Get.height / 1.55,
                    child: PageView(
                      onPageChanged: (value) {
                        controller.onPageChanged(value);
                        if (controller.searchTextController.text.isNotEmpty) {
                          if (controller.searchHistoryProducts == 0) {
                            controller.getSearchProducts();
                          }
                          if (controller.searchHistoryStores == 0) {
                            controller.getSearchProducts();
                          }
                        }
                      },
                      controller: controller.pageController,
                      children: [
                        // first page
                        const Text("doctors"),

                        // second page
                        controller.statusRequest == StatusRequest.loading
                            ? Column(
                                children: [
                                  Container(
                                    child: const CircularProgressIndicator(),
                                  )
                                ],
                              )
                            : controller.isStoreEmpty == 0
                                ? SingleChildScrollView(
                                    child: SizedBox(
                                      height: Get.height / 4,
                                      child: Column(
                                        children: [
                                          ...List.generate(
                                              controller.searchStoreData.length,
                                              (index) => InkWell(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRout.storeProfile,
                                                          arguments: {
                                                            "storeId": 0,
                                                            "details": "search",
                                                            "storesearch":
                                                                controller
                                                                        .searchStoreData[
                                                                    0]["id"]
                                                          });
                                                    },
                                                    child: Column(
                                                      children: [
                                                        CachedNetworkImage(
                                                          imageUrl:
                                                              "${controller.searchStoreData[0]["coverPath"]}",
                                                          fit: BoxFit.fill,
                                                          height:
                                                              Get.height * 0.11,
                                                          width: Get.width -
                                                              Get.width * 0.090,
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              top: Get.height *
                                                                  0.010),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                  "${controller.searchStoreData[0]["brand"]}")
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          // margin:
                                                          // EdgeInsets.only(top: Get.height * 0.010),
                                                          child: const Row(
                                                            children: [
                                                              Text(
                                                                "Tag",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              top: Get.height *
                                                                  0.010),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "${controller.searchStoreData[0]["id"]}",
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ))
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin:
                                        EdgeInsets.only(top: Get.height / 8),
                                    child: const Column(
                                      children: [
                                        Icon(
                                          Icons.not_interested_sharp,
                                          size: 150,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Nothing Found",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        )
                                      ],
                                    ),
                                  ),

                        // thiers page
                        controller.statusRequest == StatusRequest.loading
                            ? Column(
                                children: [
                                  Container(
                                    child: const CircularProgressIndicator(),
                                  )
                                ],
                              )
                            : controller.isProductEmpty == 0
                                ? SingleChildScrollView(
                                    child: Container(
                                      // height: Get.height,
                                      child: Column(
                                        children: [
                                          ...List.generate(
                                              controller.searchData.length,
                                              (index) => InkWell(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRout
                                                              .productDetails,
                                                          arguments: {
                                                            "productId": index,
                                                            "details": "search"
                                                          });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: Get.height *
                                                              0.020),
                                                      child:
                                                          CustomListProductsSearch(
                                                              data: controller
                                                                  .searchData,
                                                              index: index),
                                                    ),
                                                  ))
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin:
                                        EdgeInsets.only(top: Get.height / 8),
                                    child: const Column(
                                      children: [
                                        Icon(
                                          Icons.not_interested_sharp,
                                          size: 150,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Nothing Found",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        )
                                      ],
                                    ),
                                  )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
