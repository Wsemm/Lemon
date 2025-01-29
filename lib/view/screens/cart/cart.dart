import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/routs.dart';
import 'package:lemon/view/widgets/Cart/Cart_product.dart';
import '../../../Repositories/ApiDataRepository.dart';
import '../../../controller/Cart_Controller.dart';
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
          onPressed: () {
            Map Mymap = {};
            List myList = [];
            for (int i = 0;
                i <= repository.myCart.data!.cartItems!.length - 1;
                i++) {
              Mymap.addAll(
                {
                  "StoreId":
                      repository.myCart.data!.cartItems![i].product!.storeId!,
                  "delivery": {}
                },
              );

              myList.add({
                "productId": repository.myCart.data!.cartItems![i].product!.id,
                "productName":
                    "${repository.myCart.data!.cartItems![i].product!.name}",
                "price": repository.myCart.data!.cartItems![i].product!.price,
                "quantity": repository.myCart.data!.cartItems![i].quantity
              });
            }
            print(myList);
          },
          child: const Text(
            "subimt order",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )),
      ),
      appBar: AppBar(title: const Text("My Cart")),
      body: GetBuilder<CartController>(
        builder: (controller) => Scaffold(
          body: SizedBox(
            height: Get.height - Get.height * 0.18,
            child: repository.myCart.data!.cartItems!.isEmpty
                ? Center(
                    child: Container(
                      child: const Text(
                        "You dont have any products in your cart",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: repository.myCart.data != null
                        ? repository.myCart.data!.cartItems!.length
                        : 6,
                    itemBuilder: (context, index) => repository.myCart.data ==
                            null
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
                                "${repository.myCart.data!.cartItems![index].id}"),
                            onDismissed: (direction) {
                              controller.deleteFromCart(repository
                                  .myCart.data!.cartItems![index].product!.id!);
                              repository.myCart.data!.cartItems!
                                  .removeAt(index);
                              controller.productsQuantity.removeAt(index);
                              controller.update();
                            },
                            child: InkWell(
                                onTap: () async {
                                  // print(controller.productsQuantity[index][
                                  //     "${repository.myCart.data![index].cartItems![0].id}"]);
                                  await controller.getProductDetails(repository
                                      .myCart
                                      .data!
                                      .cartItems![index]
                                      .product!
                                      .id);
                                  Get.toNamed(AppRout.productDetails,
                                      arguments: {
                                        "productId": repository.myCart.data!
                                            .cartItems![index].product!.id,
                                        "details": "test"
                                      });
                                },
                                child: controller.productsQuantity.isEmpty
                                    ? const CartProductSkelton()
                                    : CustomCartProductds(
                                        data: repository.myCart.data!.cartItems,
                                        productsQuantity:
                                            controller.productsQuantity,
                                        index: index,
                                      )),
                          ),
                  ),
          ),
        ),
      ),
    );
  }
}
