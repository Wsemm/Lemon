import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routs.dart';

class Maincategories extends StatelessWidget {
  Maincategories(
      {super.key,
      required this.index,
      required this.filter,
      required this.mainCategoriesList});
  final int index;
  final List mainCategoriesList;
  int filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(60, 204, 192, 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: (MaterialButton(
            onPressed: () {
              switch (index) {
                case 0:
                  filter = 0;
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
                  imageUrl: "${mainCategoriesList[index]["iconPath"]}",
                  height: Get.height / 9,
                ),
                Container(
                  // margin:
                  //     EdgeInsets.only(top: Get.height * 0.010),
                  child: Text("${mainCategoriesList[index]["name"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17)),
                )
              ],
            ),
          )),
        ),
      ],
    );
  }
}
