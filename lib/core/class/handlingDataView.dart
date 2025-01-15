// import 'package:ecommerce_project/core/class/statusRequest.dart';
// import 'package:ecommerce_project/core/constant/ImageAssets.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class handlingDataView extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   final Widget? secondWidget;
//   final bool? newWidget;

//   const handlingDataView({
//     super.key,
//     required this.statusRequest,
//     required this.widget,
//     this.secondWidget,
//     this.newWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImageAsset.circle_loading,
//                 height: 500, fit: BoxFit.fill),
//           )
//         : statusRequest == StatusRequest.offlineFailuer
//             ? Center(
//                 child: Lottie.asset(AppImageAsset.offline),
//               )
//             : statusRequest == StatusRequest.serverFailuer
//                 ? Lottie.asset(AppImageAsset.server)
//                 : statusRequest == StatusRequest.failuer
//                     ? Lottie.asset(AppImageAsset.nodata)
//                     : widget;
//   }
// }

// class CustomhandlingDataView extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   final Widget secondWidget;
//   final bool? newWidget;

//   const CustomhandlingDataView({
//     super.key,
//     required this.statusRequest,
//     required this.widget,
//     required this.secondWidget,
//     this.newWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImageAsset.circle_loading,
//                 height: 500, fit: BoxFit.fill),
//           )
//         : statusRequest == StatusRequest.offlineFailuer
//             ? Center(
//                 child: Lottie.asset(AppImageAsset.offline),
//               )
//             : statusRequest == StatusRequest.serverFailuer
//                 ? Lottie.asset(AppImageAsset.server)
//                 : statusRequest == StatusRequest.failuer
//                     ? secondWidget
//                     : widget;
//   }
// }

// class handlingDataRequest extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const handlingDataRequest(
//       {super.key, required this.statusRequest, required this.widget});

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImageAsset.loading),
//           )
//         : statusRequest == StatusRequest.offlineFailuer
//             ? Center(
//                 child: Lottie.asset(AppImageAsset.offline),
//               )
//             : statusRequest == StatusRequest.serverFailuer
//                 ? Lottie.asset(AppImageAsset.server)
//                 : widget;
//   }
// }

// class myhandlingDataRequest extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const myhandlingDataRequest(
//       {super.key, required this.statusRequest, required this.widget});

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImageAsset.loading, height: 50, width: 50),
//           )
//         : statusRequest == StatusRequest.offlineFailuer
//             ? Center(
//                 child: Lottie.asset(AppImageAsset.offline),
//               )
//             : statusRequest == StatusRequest.serverFailuer
//                 ? Lottie.asset(AppImageAsset.server)
//                 : widget;
//   }
// }
