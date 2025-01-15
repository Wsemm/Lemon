import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/controller/Cart_Controller.dart';
import 'package:lemon/routs.dart';

import '../../../core/constant/AppColor.dart';
import '../../widgets/skeltons/CartProduct_Skelton.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    ApiDataRepository repository = Get.find();
    return Scaffold(
      bottomSheet: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColor.secondColor,
                AppColor.primaryColor,
                Colors.blueGrey
              ],
            ),
            borderRadius: BorderRadius.circular(20)),
        width: Get.width,
        height: Get.height * 0.05,
        margin: EdgeInsets.symmetric(
          vertical: Get.height * 0.010,
          horizontal: Get.width * 0.020,
        ),
        child: Center(
            child: MaterialButton(
          onPressed: () {},
          child: const Text(
            "subimt order",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )),
      ),
      appBar: AppBar(title: const Text("My Cart")),
      body: GetBuilder<CartController>(
        builder: (controller) => Container(
          height: Get.height - Get.height * 0.18,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: repository.myCart.data != null
                ? repository.myCart.data!.length
                : 6,
            itemBuilder: (context, index) => repository.myCart.data == null
                ? CartProductSkelton()
                : Dismissible(
                    background: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Get.height * 0.010,
                        horizontal: Get.width * 0.014,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.delete_outline_outlined,
                        size: 30,
                      ),
                    ),
                    key: ValueKey<String>(
                        "${repository.myCart.data![index].cartItems![0].id}"),
                    onDismissed: (direction) {
                      repository.myCart.data!.removeAt(index);
                      controller.productsQuantity.removeAt(index);
                      print("==== ${repository.myCart.data!.length}");
                      controller.update();

                      // print(
                      //     "DELETED DELETED DELETED DELETED   ${repository.myCart.data![index].cartItems![0].id}");
                    },
                    child: InkWell(
                      onTap: () {
                        print(controller.productsQuantity[index][
                            "${repository.myCart.data![index].cartItems![0].id}"]);
                        // controller.getProductDetails(
                        //     repository.myCart.data![index].cartItems![0].id);
                        // Get.toNamed(AppRout.productDetails, arguments: {
                        //   "productId":
                        //       repository.myCart.data![index].cartItems![0].id,
                        //   "details": "test"
                        // });
                      },
                      child:  controller.productsQuantity.isEmpty
                              ? const CartProductSkelton()
                              : Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.secondColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.symmetric(
                                    vertical: Get.height * 0.010,
                                    horizontal: Get.width * 0.014,
                                  ),
                                  width: Get.width,
                                  height: Get.height / 8,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Container(
                                            height: double.infinity,
                                            child: CachedNetworkImage(
                                                imageUrl:
                                                    "${repository.myCart.data![index].cartItems![0].productImageUrl}"),
                                          )),
                                      Expanded(
                                          flex: 6,
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              children: [
                                                Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    margin: EdgeInsets.only(
                                                        bottom:
                                                            Get.height * 0.020,
                                                        top: Get.height * 0.010,
                                                        left:
                                                            Get.width * 0.020),
                                                    child: Text(
                                                        "${repository.myCart.data![index].cartItems![0].productName}")),
                                                Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    margin: EdgeInsets.only(
                                                        left:
                                                            Get.width * 0.020),
                                                    child: Text(
                                                      "${repository.myCart.data![index].cartItems![0].price}",
                                                      style: const TextStyle(
                                                          color: AppColor
                                                              .secondColor),
                                                    )),
                                              ],
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: Get.width * 0.020),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      if (controller.productsQuantity[
                                                                  index][
                                                              "${repository.myCart.data![index].cartItems![0].id!}"] !=
                                                          0) {
                                                        controller.productsQuantity[
                                                                    index][
                                                                "${repository.myCart.data![index].cartItems![0].id!}"] =
                                                            controller.productsQuantity[
                                                                        index][
                                                                    "${repository.myCart.data![index].cartItems![0].id!}"]! -
                                                                1;
                                                      }
                                                      controller.patchMyCart(
                                                          repository
                                                              .myCart
                                                              .data![index]
                                                              .cartItems![0]
                                                              .productId!,
                                                          controller.productsQuantity[
                                                                  index][
                                                              "${repository.myCart.data![index].cartItems![0].id!}"]!,
                                                          repository
                                                              .myCart
                                                              .data![index]
                                                              .storeId!,
                                                          repository
                                                              .myCart
                                                              .data![index]
                                                              .cartItems![0]
                                                              .cartId!);
                                                      controller.update();
                                                    },
                                                    child: Container(
                                                      child: const Icon(
                                                          Icons.remove),
                                                    )),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Get.width * 0.010,
                                                  ),
                                                  child: Text(
                                                    "${controller.productsQuantity[index]["${repository.myCart.data![index].cartItems![0].id!}"]}",
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      controller.productsQuantity[
                                                                  index][
                                                              "${repository.myCart.data![index].cartItems![0].id!}"] =
                                                          controller.productsQuantity[
                                                                      index][
                                                                  "${repository.myCart.data![index].cartItems![0].id!}"]! +
                                                              1;
                                                      controller.patchMyCart(
                                                          repository
                                                              .myCart
                                                              .data![index]
                                                              .cartItems![0]
                                                              .productId!,
                                                          controller.productsQuantity[
                                                                  index][
                                                              "${repository.myCart.data![index].cartItems![0].id!}"]!,
                                                          repository
                                                              .myCart
                                                              .data![index]
                                                              .storeId!,
                                                          repository
                                                              .myCart
                                                              .data![index]
                                                              .cartItems![0]
                                                              .cartId!);
                                                      print(
                                                          "${repository.myCart.data![index].cartItems![0].cartId!}");
                                                      controller.update();
                                                    },
                                                    child: Container(
                                                      child:
                                                          const Icon(Icons.add),
                                                    ))
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
