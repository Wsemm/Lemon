import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';

import '../../../core/constant/AppColor.dart';

class CustomListStoresCategories extends StatelessWidget {
  const CustomListStoresCategories(
      {super.key, required this.index, required this.selectedCat});
  final int index;
  final List selectedCat;
  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[400],

              // color: Colors.greenAccent,
              border: selectedCat.contains(index)
                  ? Border.all(width: 2, color: AppColor.primaryColor)
                  : null,
              borderRadius: BorderRadius.circular(80)),
          margin: EdgeInsets.only(
            right: Get.width * 0.010,
            left: Get.width * 0.010,
            bottom: Get.width * 0.010,
          ),
          width: Get.width / 5.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.red,
                width: Get.width / 5.5,

                // height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${repository.storeCategories.data![index].iconPath}",
                    // fit: BoxFit.fill,
                    height: 50,
                  ),
                ),
                //  Image.asset(
                //   AppImage.doctor1,
                //   height: 50,
                //   fit: BoxFit.fill,
                // ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            // bottom: 5,
            left: 10,
            right: Get.width * 0.030,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("${repository.storeCategories.data![index].name}"
                    // "${controller.storeCategories[index]["name"]}"

                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CustomListStoresCategoriesSkelton extends StatelessWidget {
  const CustomListStoresCategoriesSkelton();
  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[400],

              // color: Colors.greenAccent,

              borderRadius: BorderRadius.circular(80)),
          margin: EdgeInsets.only(
            right: Get.width * 0.010,
            left: Get.width * 0.010,
            bottom: Get.width * 0.010,
          ),
          width: Get.width / 5.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.red,
                width: Get.width / 5.5,

                // height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    height: 50,
                    color: Colors.grey,
                  ),
                ),
                //  Image.asset(
                //   AppImage.doctor1,
                //   height: 50,
                //   fit: BoxFit.fill,
                // ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            // bottom: 5,
            left: 10,
            right: Get.width * 0.030,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("name",style: TextStyle(color: Colors.grey),
                    // "${controller.storeCategories[index]["name"]}"

                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}
