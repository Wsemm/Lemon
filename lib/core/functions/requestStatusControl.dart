import 'package:flutter/material.dart';
import '../class/statusRequest.dart';
import '../constant/AppColor.dart';

class handlingRequestStatus extends StatelessWidget {
  const handlingRequestStatus(
      {super.key,
      required this.statusRequest,
      required this.widget,
      this.customWidget,
      this.secondWidget});
  final StatusRequest statusRequest;
  final Widget widget;
  final Widget? secondWidget;
  final int? customWidget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? customWidget == 1
            ? secondWidget!
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColor.secondColor,
                ),
              )
        : widget;
  }
}
