import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/controller/Cart_Controller.dart';
import 'package:lemon/routs.dart';
import 'package:lemon/view/widgets/Cart/Cart_product.dart';

import '../../../core/constant/AppColor.dart';
import '../../widgets/Cart/Cart_stores.dart';
import '../../widgets/Store/Custom_ListStores.dart';
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
        builder: (controller) => SizedBox(
          height: Get.height - Get.height * 0.18,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: repository.myCart.data != null
                ? 1 //repository.myCart.data!.length
                : 6,
            itemBuilder: (context, index) => repository.myCart.data == null
                ? const CartProductSkelton()
                : Dismissible(
                    background: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Get.height * 0.010,
                        horizontal: Get.width * 0.014,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
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
                        child: controller.productsQuantity.isEmpty
                            ? const CartProductSkelton()
                            : InkWell(
                                onTap: () {
                                  Get.toNamed(AppRout.cartStoreProducts,
                                      arguments: {"id": index});
                                },
                                child: CartStores(
                                  data: repository.myCart.data!,
                                  index: index,
                                  home: 1,
                                ),
                              )

                        // CustomCartProductds(
                        //     data: repository.myCart.data!,
                        //     productsQuantity: controller.productsQuantity,
                        //     index: index,
                        //   ),
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
