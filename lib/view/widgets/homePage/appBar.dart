import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Repositories/ApiDataRepository.dart';
import '../../../core/constant/AppColor.dart';
import '../../../routs.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    return Container(
      height: Get.height * 0.090,
      // margin: EdgeInsets.only(top: Get.height*0.030),
      color: const Color.fromRGBO(19, 123, 114, 0.8),
      child: Container(
        margin: EdgeInsets.only(top: Get.height * 0.030),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                Text.rich(TextSpan(children: [
                  const TextSpan(
                      text: "Delviery to ",
                      style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: repository.addressList.isNotEmpty
                          ? " ${repository.addressList[0]["label"]}"
                          : "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondColorLight))
                ])),
                // Text(
                //   "Delviery to ${repository.addressList.isNotEmpty ? "${repository.addressList[0]["label"]}" : ""}",
                //   style: TextStyle(color: Colors.white),
                // ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
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
    );
  }
}
