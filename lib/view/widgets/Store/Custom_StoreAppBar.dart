import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/controller/search_Controller.dart';

import '../../../routs.dart';

class CustomStoreAppBar extends StatelessWidget {
  const CustomStoreAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    SearchController searchController = Get.find();
    return Container(
      color: const Color.fromRGBO(19, 123, 114, 0.8),
      child: Container(
        margin: EdgeInsets.only(top: Get.height * 0.030),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
            ),
            const Text(
              "Stores",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
                onPressed: () {
                  searchController.searchTextController.clear();
                  Get.toNamed(AppRout.search);
                },
                icon: const Icon(Icons.search),
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}
