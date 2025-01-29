import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/AppColor.dart';

class SlidersImages extends StatelessWidget {
  const SlidersImages({super.key, r, required this.imageList});

  final List imageList;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        height: Get.height / 6.5,
        margin: EdgeInsets.only(
          bottom: Get.height * 0.015,
          left: Get.width * 0.020,
          right: Get.width * 0.020,
        ),
        child: CarouselSlider.builder(
            itemCount: imageList.length - 1,
            itemBuilder: (context, index, realIndex) {
              // final urlimage = imagel[index]["image"];
              return Container(
                // margin: EdgeInsets.symmetric(
                //   horizontal: 5,
                // ),
                child: CachedNetworkImage(
                  imageUrl: imageList[index]["imagePath"],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 5,

              autoPlay: true, // Enable auto play
              autoPlayInterval:
                  const Duration(seconds: 3), // Auto play interval
              autoPlayAnimationDuration:
                  const Duration(milliseconds: 800), // Animation duration
              enlargeCenterPage: true, // Size of the current active page
              enableInfiniteScroll: true, // Infinite scroll
              pauseAutoPlayOnTouch: true, // Pause on touch
            )));
  }
}
