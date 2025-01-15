import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';

import '../../../controller/Products/product_controller.dart';
import '../../../core/constant/AppColor.dart';
import '../../widgets/prducts/Custom_ProductDetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.find();
    ApiDataRepository repository = Get.find();

    return Scaffold(
        bottomSheet: Container(
          width: Get.width,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: MaterialButton(
            onPressed: () {
              switch (controller.screen) {
                case "store":
                  controller.addToCart(
                    repository.storeProducts[controller.index]["storeId"],
                    repository.storeProducts[controller.index]["id"],
                    1,
                  );
                  break;
                case "search":
                  controller.addToCart(
                    repository.productSearchData[controller.index]["storeId"],
                    repository.productSearchData[controller.index]["id"],
                    2,

                    // repository.productSearchData[controller.index]["id"],
                    // repository.productSearchData[controller.index]["price"],
                    // 2,
                    // repository.productSearchData[controller.index]["storeId"],
                    // repository.productSearchData[controller.index]["name"],
                    // "${repository.profileModel.phoneNumber}",
                    // "${repository.profileModel.name}",
                    // "${repository.profileModel.city}",
                    // "dsadsa"
                  );
                  break;
                case "homePage":
                  controller.addToCart(
                      repository.sections[2]["items"][controller.index]
                          ["storeId"],
                      repository.sections[2]["items"][controller.index]["id"],
                      3);
                  break;
                default:
              }

              // switch (controller.screen) {
              //   case "store":
              //     controller.checkOut(
              //         repository.storeProducts[controller.index]["id"],
              //         repository.storeProducts[controller.index]["price"],
              //         2,
              //         repository.storeProducts[controller.index]["storeId"],
              //         repository.storeProducts[controller.index]["name"],
              //         "${repository.profileModel.phoneNumber}",
              //         "${repository.profileModel.name}",
              //         "${repository.profileModel.city}",
              //         "dsadsa");
              //     break;
              //   case "search":
              //     controller.checkOut(
              //         repository.productSearchData[controller.index]["id"],
              //         repository.productSearchData[controller.index]["price"],
              //         2,
              //         repository.productSearchData[controller.index]["storeId"],
              //         repository.productSearchData[controller.index]["name"],
              //         "${repository.profileModel.phoneNumber}",
              //         "${repository.profileModel.name}",
              //         "${repository.profileModel.city}",
              //         "dsadsa");
              //     break;
              //   case "homePage":
              //     controller.checkOut(
              //         repository.sections[2]["items"][controller.index]["id"],
              //         repository.sections[2]["items"][controller.index]
              //             ["price"],
              //         2,
              //         repository.sections[2]["items"][controller.index]
              //             ["storeId"],
              //         repository.sections[2]["items"][controller.index]["name"],
              //         "${repository.profileModel.phoneNumber}",
              //         "${repository.profileModel.name}",
              //         "${repository.profileModel.city}",
              //         "dsadsa");
              //     break;
              //   default:
              // }
            },
            child: const Text(
              "Add To Cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: CustomProductDetails(
            data: controller.screen == "store"
                ? repository.storeProducts
                : controller.screen == "search"
                    ? repository.productSearchData
                    : controller.screen == "search"
                        ? repository.prodcutDetails
                        : repository.sections[2]["items"],
            details: controller.screen,
            index: controller.index,
            color: controller.colorList)

        //  Column(
        //   // crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       color: const Color.fromRGBO(19, 123, 114, 0.8),
        //       child: Container(
        //         margin: EdgeInsets.only(top: Get.height * 0.030),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Container(
        //               child: IconButton(
        //                 onPressed: () {
        //                   Get.back();
        //                 },
        //                 icon: const Icon(Icons.arrow_back_ios),
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Stack(
        //       children: [
        //         Container(
        //           width: Get.width,
        //           height: Get.height * 0.3,
        //           child: Hero(
        //               tag: controller.details == 1
        //                   ? "${repository.storeProducts[controller.index]["id"]}"
        //                   : controller.details == 2
        //                       ? "${repository.productSearchData[controller.index]["id"]}"
        //                       : "${repository.productsModel[controller.index]["id"]}",
        //               // child: Image.asset(AppImage.laptop)),
        //               child: CachedNetworkImage(
        //                   imageUrl: controller.details == 1
        //                       ? "${repository.storeProducts[controller.index]["imageURL"]}"
        //                       : controller.details == 2
        //                           ? "${repository.productSearchData[controller.index]["imageURL"]}"
        //                           : "${repository.productsModel[controller.index]["imageURL"]}")),
        //         ),
        //         Container(
        //           margin: EdgeInsets.only(
        //               left: Get.width - 75, top: Get.height * 0.020),
        //           child: MaterialButton(
        //               shape: const CircleBorder(),
        //               // color: Color.fromRGBO(206, 203, 203, 0.498),
        //               onPressed: () {
        //                 print("${repository.productsModel}");
        //               },
        //               child: const Icon(
        //                 Icons.favorite_border,
        //                 color: AppColor.primaryColor,
        //               )),
        //         )
        //       ],
        //     ),
        //     Container(
        //       // margin: EdgeInsets.only(
        //       //     top: Get.height * 0.020, right: Get.width / 2.8),
        //       child: Text(
        //         // "${controller.repository.productsModel.name}",
        //         controller.details == 1
        //             ? "${repository.storeProducts[controller.index]["name"]}"
        //             : controller.details == 2
        //                 ? "${repository.productSearchData[controller.index]["name"]}"
        //                 : "${repository.productsModel[controller.index]["name"]}",

        //         style: const TextStyle(
        //             color: AppColor.primaryColor,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 22),
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.symmetric(
        //         vertical: Get.height * 0.020,
        //         horizontal: Get.width * 0.040,
        //       ),
        //       child: Text(
        //         controller.details == 1
        //             ? "${repository.storeProducts[controller.index]["description"]}"
        //             : controller.details == 2
        //                 ? "${repository.productSearchData[controller.index]["description"]}"
        //                 : "${repository.productsModel[controller.index]["description"]}",
        //         style: TextStyle(
        //             color: Colors.grey[500],
        //             fontWeight: FontWeight.bold,
        //             fontSize: 22),
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.symmetric(horizontal: Get.width * 0.040),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           const Text(
        //             "Colors",
        //             style: TextStyle(fontSize: 20),
        //           ),
        //           Text(
        //             // "${controller.repository.productsModel.price} \$",
        //             controller.details == 1
        //                 ? "${repository.storeProducts[controller.index]["price"]}"
        //                 : controller.details == 2
        //                     ? "${repository.productSearchData[controller.index]["price"]}"
        //                     : "${repository.productsModel[controller.index]["price"]} \$",

        //             style: const TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 22,
        //                 color: AppColor.primaryColor),
        //           )
        //         ],
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.only(top: Get.height * 0.030),
        //       child: Row(
        //         children: [
        //           ...List.generate(
        //               5,
        //               (index) => Container(
        //                     margin: const EdgeInsets.symmetric(
        //                       horizontal: 10,
        //                     ),
        //                     child: CircleAvatar(
        //                       maxRadius: 20,
        //                       backgroundColor: controller.colorList[index],
        //                     ),
        //                   ))
        //         ],
        //       ),
        //     )
        //   ],
        // )
        );
  }
}
