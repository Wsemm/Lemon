import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routs.dart';
import '../Custom_ListProducts.dart';
import '../Store/Custom_ListStores.dart';

class HomePageProductSection extends StatelessWidget {
  const HomePageProductSection({
    super.key,
    required this.sections,
  });
  final sections;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.white,
          margin:
              EdgeInsets.only(left: Get.width * 0.020, top: Get.height * 0.015),
          child: Row(
            children: [
              Text(
                "${sections[2]["title"]}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: Get.height * 0.015,
              left: Get.width * 0.020,
              right: Get.width * 0.020),
          width: Get.width - 25,
          height: Get.height / 4.4,
          child: ListView.builder(
            // controller: controller.scrollController,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: sections[2]["items"].length,
            itemBuilder: (context, index) => Container(
                width: Get.width / 2,
                margin: EdgeInsets.only(right: Get.width * 0.015),
                child: CustomListProducts(
                    data: sections[2]["items"], index: index)),
          ),
        ),
      ],
    );
  }
}

class HomePageStoreSpecialOffersSection extends StatelessWidget {
  const HomePageStoreSpecialOffersSection(
      {super.key, required this.section, required this.listIndex});
  final section;
  final int listIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: Get.width * 0.020),
          child: Row(
            children: [
              Text(
                "${section[listIndex]["title"]}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(
              left: Get.width * 0.020, right: Get.width * 0.020),
          width: Get.width - 25,
          height: Get.height / 4.2,
          child: ListView.builder(
            // controller: controller.scrollController,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: section[listIndex]["items"].length,
            itemBuilder: (context, index) => Row(
              children: [
                InkWell(
                  onTap: () {
                    print("${section[listIndex]["items"][index]["id"]}");
                    Get.toNamed(AppRout.storeProfile, arguments: {
                      "storeId": section[listIndex]["items"][index]["id"],
                      "details": "filteredStore"
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: Get.width * 0.015),
                      child: CustomListStores(
                          home: 1,
                          data: section[listIndex]["items"],
                          index: index)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
