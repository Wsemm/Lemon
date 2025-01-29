import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Repositories/ApiDataRepository.dart';

import '../../../controller/Cart_Controller.dart';
import '../../widgets/Cart/Cart_product.dart';
import '../../widgets/skeltons/CartProduct_Skelton.dart';

class CartStoreProducts extends StatelessWidget {
  const CartStoreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    return GetBuilder<CartController>(
      builder: (controller) => Scaffold(
        body: SizedBox(
          height: Get.height - Get.height * 0.18,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: repository.myCart.data != null
                  ? 1 //repository.myCart.data!.length
                  : 6,
              itemBuilder: (context, index) => repository.myCart.data == null
                  ? const CartProductSkelton()
                  : Text("s")
              // : Dismissible(
              //     background: Container(
              //       margin: EdgeInsets.symmetric(
              //         vertical: Get.height * 0.010,
              //         horizontal: Get.width * 0.014,
              //       ),
              //       decoration: BoxDecoration(
              //           color: Colors.red,
              //           borderRadius: BorderRadius.circular(10)),
              //       child: const Icon(
              //         Icons.delete_outline_outlined,
              //         size: 30,
              //       ),
              //     ),
              //     key: ValueKey<String>(
              //         "${repository.myCart.data![index].cartItems![0].id}"),
              //     onDismissed: (direction) {
              //       repository.myCart.data!.removeAt(index);
              //       controller.productsQuantity.removeAt(index);
              //       print("==== ${repository.myCart.data!.length}");
              //       controller.update();

              //       // print(
              //       //     "DELETED DELETED DELETED DELETED   ${repository.myCart.data![index].cartItems![0].id}");
              //     },
              //     child: InkWell(
              //         onTap: () {
              //           print(controller.productsQuantity[index][
              //               "${repository.myCart.data![index].cartItems![0].id}"]);
              //           // controller.getProductDetails(
              //           //     repository.myCart.data![index].cartItems![0].id);
              //           // Get.toNamed(AppRout.productDetails, arguments: {
              //           //   "productId":
              //           //       repository.myCart.data![index].cartItems![0].id,
              //           //   "details": "test"
              //           // });
              //         },
              //         child: controller.productsQuantity.isEmpty
              //             ? const CartProductSkelton()
              //             : CustomCartProductds(
              //                 data: repository.myCart.data!,
              //                 productsQuantity: controller.productsQuantity,
              //                 index: index,
              //               )),
              //   ),
              ),
        ),
      ),
    );
  }
}
