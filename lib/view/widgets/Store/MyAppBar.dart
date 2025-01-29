import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routs.dart';
import '../../../core/constant/AppColor.dart';

class StoreProfileAppBar extends StatelessWidget {
  const StoreProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Get.height * 0.010,
          left: Get.width * 0.015,
          right: Get.width * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: Get.height * 0.010),
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(AppRout.search);
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: Get.height * 0.010),
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 20,
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                  ),
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
