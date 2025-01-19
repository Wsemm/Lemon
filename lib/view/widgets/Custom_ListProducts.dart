import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/core/constant/AppImage.dart';
import 'package:lemon/model/store_info_model.dart';
import '../../core/constant/AppColor.dart';
import '../../core/functions/formateNumber.dart';
import '../../routs.dart';

class CustomListProducts extends StatelessWidget {
  final data;
  final int index;
  final homePage;
  const CustomListProducts(
      {super.key, required this.data, required this.index, this.homePage});

  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    return Container(
      width: Get.width / 2,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset of the shadow
            ),
          ],
          // color: Colors.grey[350]
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(15)),
            child: Hero(
              tag: "product_${data[index]["id"]}",
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRout.productDetails, arguments: {
                    "productId": index,
                    "details": "homePage",
                    // "data": "${repository.productsModel}"
                  });
                },
                child: CachedNetworkImage(
                  imageUrl: "${data[index]["imageURL"]}",
                  height: Get.height * 0.11,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Get.height * 0.015, left: Get.width * 0.020),
            width: Get.width / 2,
            height: Get.height * 0.05,
            child: Text(
              "${data[index]["name"]}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width / 2,
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "${formatNumber(data[index]["price"])} \$",
                    style: const TextStyle(
                      fontFamily: "sans",
                      // color: AppColor.primaryColor,
                      color: Colors.black,

                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 25,
                  height: 25,
                  child: GestureDetector(
                    onTap: () => print("dsa"),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListProductsStore extends StatelessWidget {
  final data;
  final int index;
  final int? list;
  const CustomListProductsStore(
      {super.key, required this.data, required this.index, this.list});

  @override
  Widget build(BuildContext context) {
    StoreInfoModel storeInfoModel = StoreInfoModel();
    ApiDataRepository repository = Get.find();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: Get.width,
      height: Get.height / 4.4,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Get.height * 0.005, horizontal: Get.width * 0.010),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: Get.width / 2.1,
            // margin: EdgeInsets.symmetric(
            //   vertical: Get.height * 0.001,
            // ),
            margin: EdgeInsets.only(top: Get.height * 0.001),
            child: Column(
              children: [
                SizedBox(
                  height: Get.width * 0.1,
                  child: Text(
                    list == 1
                        ? "${data[index]["name"]}"
                        : "${data!.products![index].name}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Container(
                  height: Get.height * 0.1,
                  margin: EdgeInsets.only(top: Get.height * 0.008),
                  child: Text(
                    list == 1
                        ? "${data[index]["description"]}"
                        : "${data!.products![index].description}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.040,
                  // margin: EdgeInsets.only(top: Get.height * 0.010),
                  child: Row(
                    children: [
                      Text(
                        list == 1
                            ? "${data![index]["price"]} \$"
                            : "${formatNumber(data!.products![index].price)} \$",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: Get.height * 0.015,
            ),
            child: CachedNetworkImage(
              // imageUrl: "${data[index]["imageURL"]}",
              imageUrl: list == 1
                  ? "${data[index]["imageURL"]}"
                  : "${data!.products![index].imageUrl}",
              height: Get.height,
              width: Get.width / 2.2,
              fit: BoxFit.fill,
              // color: Colors.grey[500],
            ),
          ),
        ]),
      ),
    );
    // Container(
    //   width: Get.width / 2,
    //   decoration: BoxDecoration(
    //       color: Colors.grey[350], borderRadius: BorderRadius.circular(15)),
    //   child: Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //             color: Colors.grey[350],
    //             borderRadius: BorderRadius.circular(15)),
    //         child: Hero(
    //           tag: "${data[index]["id"]}",
    //           child: GestureDetector(
    //             onTap: () {
    //               Get.toNamed(AppRout.productDetails,
    //                   arguments: {"productId": index});
    //             },
    //             child: CachedNetworkImage(
    //               imageUrl: "${data[index]["imageURL"]}",
    //               height: Get.height * 0.11,
    //               width: Get.width,
    //               fit: BoxFit.fill,
    //               color: Colors.grey[500],
    //             ),
    //           ),
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(left: 10),
    //         // padding: EdgeInsets.only(
    //         //   top: Get.height * 0.010,
    //         // ),
    //         width: Get.width,
    //         // height: Get.height * 0.07,
    //         child: Text(
    //           "${data[index]["name"]}",
    //           style: const TextStyle(
    //               color: Colors.black,
    //               fontSize: 17,
    //               fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       Container(
    //         // width: Get.width / 2,
    //         margin: const EdgeInsets.only(top: 8,bottom: 10),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Container(
    //               margin: const EdgeInsets.only(left: 10),
    //               child: Text(
    //                 "${data[index]["price"]} \$",
    //                 style: const TextStyle(
    //                   fontFamily: "sans",
    //                   color: AppColor.primaryColor,
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.only(right: 15),
    //               width: 25,
    //               height: 25,
    //               child: GestureDetector(
    //                 onTap: () => print("dsa"),
    //                 child: const Icon(
    //                   Icons.favorite_border,
    //                   size: 25,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class CustomListProductsSearch extends StatelessWidget {
  final data;
  final int index;
  const CustomListProductsSearch(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: Get.width,
      height: Get.height / 4.3,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: Get.width / 2.1,
            // margin: EdgeInsets.symmetric(
            //   vertical: Get.height * 0.001,
            // ),
            margin: EdgeInsets.only(top: Get.height * 0.001),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "${data[index]["name"]}",
                        // "${data![index].name}",

                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * 0.13,
                  margin: EdgeInsets.only(top: Get.height * 0.008),
                  child: Text(
                    "${data[index]["description"]}",
                    // "${data![index]["description"]}",

                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: Get.height * 0.010),
                  child: Row(
                    children: [
                      Text(
                        // "${data!.products![index].price} \$",
                        "${formatNumber(data![index]["price"])} \$",

                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: Get.height * 0.015,
            ),
            child: CachedNetworkImage(
              imageUrl: "${data[index]["imageURL"]}",
              // imageUrl: "${data![index]["imageUrl"]}",
              height: Get.height,
              width: Get.width / 2.4,
              fit: BoxFit.fill,
              // color: Colors.grey[500],
            ),
          ),
        ]),
      ),
    );
  }
}
