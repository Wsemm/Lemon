import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Custom_ListStoresCategories.dart';
import 'Custom_ListStoresSkelton.dart';

class StoreSkelton extends StatelessWidget {
  const StoreSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (repository.storeCategories.data != null)
        // const CustomStoreAppBar(),

        SizedBox(
          height: Get.height - 100,
          child: ListView(children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.010, vertical: Get.height * 0.010),
              height: Get.height * 0.1,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                      5,
                      (index) => InkWell(
                          onTap: () {},
                          child: const CustomListStoresCategoriesSkelton()))
                ],
              ),
            ),
            ...List.generate(
                3,
                (index) => InkWell(
                      onTap: () {},
                      child: const CustomListStoresSkelton(),
                    )),
          ]),
        )
      ],
    );
  }
}
