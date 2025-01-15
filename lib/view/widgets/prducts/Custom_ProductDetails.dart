import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import '../../../controller/Products/product_controller.dart';
import '../../../core/constant/AppColor.dart';

class CustomProductDetails extends StatelessWidget {
  const CustomProductDetails(
      {super.key, this.data, this.details, this.index, required this.color});
  final data, details, index;
  final List<Color> color;
  @override
  Widget build(BuildContext context) {
    // ProductController controller = Get.find();
    // ApiDataRepository repository = Get.find();

    return Scaffold(
        body: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color.fromRGBO(19, 123, 114, 0.8),
          child: Container(
            margin: EdgeInsets.only(top: Get.height * 0.030),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.3,
              child: Hero(
                  tag: "product_${data[index]["id"]}",
                  // child: Image.asset(AppImage.laptop)),
                  child: CachedNetworkImage(
                      imageUrl: "${data[index]["imageURL"]}")),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: Get.width - 75, top: Get.height * 0.020),
              child: MaterialButton(
                  shape: const CircleBorder(),
                  // color: Color.fromRGBO(206, 203, 203, 0.498),
                  onPressed: () {
                    print("test");
                  },
                  child: const Icon(
                    Icons.favorite_border,
                    color: AppColor.primaryColor,
                  )),
            )
          ],
        ),
        Container(
          // margin: EdgeInsets.only(
          //     top: Get.height * 0.020, right: Get.width / 2.8),
          child: Text(
            // "${controller.repository.productsModel.name}",
            "${data[index]["name"]}",

            style: const TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: Get.height * 0.020,
            horizontal: Get.width * 0.040,
          ),
          child: Text(
            "${data[index]["description"]}",
            style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.040),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Colors",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                // "${controller.repository.productsModel.price} \$",
                "${data[index]["price"]}",

                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.primaryColor),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Get.height * 0.030),
          child: Row(
            children: [
              ...List.generate(
                  5,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: CircleAvatar(
                          maxRadius: 20,
                          backgroundColor: color[index],
                        ),
                      ))
            ],
          ),
        )
      ],
    ));
  }
}
