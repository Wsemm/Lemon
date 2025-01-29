import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/AppColor.dart';

class ChatBotss extends StatelessWidget {
  ChatBotss({
    super.key,
    required this.displayedText,
    required this.fullText,
    required this.requsetTextController,
    required this.isExpanded,
    required this.currentIndex,
    // required this.sendForChatBot
  });
  String displayedText, fullText;
  final TextEditingController requsetTextController;
  final isExpanded;
  int currentIndex;
  // final Function() sendForChatBot;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      bottom: isExpanded ? 0 : -MediaQuery.of(context).size.height * 0.75,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor),
            color: AppColor.secondColorLight,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.65,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                      margin: EdgeInsets.all(Get.width * 0.030),
                      child: Text(
                        displayedText,
                        style: const TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.all(Get.width * 0.020),
                    child: TextField(
                      controller: requsetTextController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              displayedText = "";
                              fullText = "";
                              // sendForChatBot();
                              requsetTextController.clear();
                              currentIndex = 0;
                            },
                            child: const Icon(Icons.send),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
