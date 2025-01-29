import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/model/my_cart_model.dart';
import '../../../controller/Cart_Controller.dart';

import '../../../core/constant/AppColor.dart';

class CustomCartProductds extends StatelessWidget {
  const CustomCartProductds({
    super.key,
    required this.data,
    required this.productsQuantity,
    required this.index,
  });

  final data;
  final List productsQuantity;
  final index;

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondColor),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(
        vertical: Get.height * 0.010,
        horizontal: Get.width * 0.014,
      ),
      width: Get.width,
      height: Get.height / 7,
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: SizedBox(
                height: double.infinity,
                child: CachedNetworkImage(
                    // imageUrl: "${data.data!.cartItems![0].product!.imageUrl}"),

                    imageUrl: "${data[index].product!.imageUrl}"),

                // "${data[index].cartItems![index].productImageUrl}"),
              )),
          Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            bottom: Get.height * 0.020,
                            top: Get.height * 0.010,
                            left: Get.width * 0.020),
                        child: Text("${data[index].product.name}")),

                    // child: Text("${data[index].product.productName}")),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: Get.width * 0.020),
                        child: Text(
                          "${data[index].product.price}",
                          style: const TextStyle(color: AppColor.secondColor),
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: Get.width * 0.020),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          if (productsQuantity[index]["${data[index].id!}"] !=
                              1) {
                            productsQuantity[index]["${data[index].id!}"] =
                                productsQuantity[index]["${data[index].id!}"]! -
                                    1;
                          }
                          controller.patchMyCart(
                            data[index].product.id!,
                            productsQuantity[index]["${data[index].id!}"]!,
                          );
                          controller.update();
                        },
                        child: Container(
                          child: const Icon(Icons.remove),
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.010,
                      ),
                      child: Text(
                        "${productsQuantity[index]["${data[index].id!}"]}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          productsQuantity[index]["${data[index].id!}"] =
                              productsQuantity[index]["${data[index].id!}"]! +
                                  1;
                          controller.patchMyCart(
                            data[index].product.id!,
                            productsQuantity[index]["${data[index].id!}"]!,
                          );
                          // print("${data[index].product.cartId!}");
                          controller.update();
                        },
                        child: Container(
                          child: const Icon(Icons.add),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
