import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';

class CustomListStoresSkelton extends StatelessWidget {
  const CustomListStoresSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ApiDataRepository repository = Get.find();
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Get.height * 0.010,
            horizontal: Get.width * 0.020,
          ),
          width: Get.width,
          height: Get.height / 5,
          child: Column(
            children: [
              Container(
                height: Get.height * 0.11,
                width: Get.width - Get.width * 0.090,
                color: Color.fromRGBO(221, 221, 221, 1),
              ),
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.010),
                child: Row(
                  children: [Text("name")],
                ),
              ),
              Container(
                // margin:
                // EdgeInsets.only(top: Get.height * 0.010),
                child: Row(
                  children: [
                    Text(
                      "Tag",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.010),
                child: Row(
                  children: [
                    Text(
                      "id",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
