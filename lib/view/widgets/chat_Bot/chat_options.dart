import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/ChatBot/chatBot_Controller.dart';
import '../../../core/constant/AppColor.dart';

class Chose extends StatelessWidget {
  const Chose({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    ChatBotController chatBotController = Get.find();
    return index == 7
        ? Container(
            margin: const EdgeInsets.only(left: 10, top: 5),
            height: Get.height * 0.12,
            child: Column(
              children: [
                Container(
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        mainAxisExtent: Get.height * 0.050,
                        crossAxisCount: 3),
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: Get.height * 0.025),
                        height: Get.height * 0.050,
                        decoration: BoxDecoration(
                            color: AppColor.secondColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          onPressed: () {
                            chatBotController.textController.text = "EARTHY";
                            chatBotController.submitAnswer();
                          },
                          child: const Text("earthy"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: Get.height * 0.025),
                        height: Get.height * 0.050,
                        decoration: BoxDecoration(
                            color: AppColor.secondColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          onPressed: () {
                            chatBotController.textController.text = "PINKY";
                            chatBotController.submitAnswer();
                          },
                          child: const Text("pinky"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : index == 8
            ? Container(
                margin: const EdgeInsets.only(left: 10, top: 5),
                height: Get.height * 0.12,
                child: Column(
                  children: [
                    Container(
                      child: GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            mainAxisExtent: Get.height * 0.050,
                            crossAxisCount: 3),
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: Get.height * 0.025),
                            height: Get.height * 0.050,
                            decoration: BoxDecoration(
                                color: AppColor.secondColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: MaterialButton(
                              onPressed: () {
                                chatBotController.textController.text = "male";
                                chatBotController.submitAnswer();
                              },
                              child: const Text("male"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: Get.height * 0.025),
                            height: Get.height * 0.050,
                            decoration: BoxDecoration(
                                color: AppColor.secondColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: MaterialButton(
                              onPressed: () {
                                chatBotController.textController.text =
                                    "female";
                                chatBotController.submitAnswer();
                              },
                              child: const Text("female"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : index == 9
                ? Container(
                    margin: const EdgeInsets.only(left: 10, top: 5),
                    height: Get.height * 0.12,
                    child: Column(
                      children: [
                        Container(
                          child: GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: Get.height * 0.050,
                                    crossAxisCount: 3),
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(right: Get.height * 0.025),
                                height: Get.height * 0.050,
                                decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    chatBotController.textController.text =
                                        "white";
                                    chatBotController.submitAnswer();
                                  },
                                  child: const Text("white"),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: Get.height * 0.025),
                                height: Get.height * 0.050,
                                decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    chatBotController.textController.text =
                                        "dark";
                                    chatBotController.submitAnswer();
                                  },
                                  child: const Text("dark"),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: Get.height * 0.025),
                                height: Get.height * 0.050,
                                decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    chatBotController.textController.text =
                                        "brown";
                                    chatBotController.submitAnswer();
                                  },
                                  child: const Text("brown"),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: Get.height * 0.025),
                                height: Get.height * 0.050,
                                decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    chatBotController.textController.text =
                                        "tan";
                                    chatBotController.submitAnswer();
                                  },
                                  child: const Text("tan"),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : index == 10
                    ? Container(
                        margin: const EdgeInsets.only(left: 10, top: 5),
                        height: Get.height * 0.12,
                        child: Column(
                          children: [
                            Container(
                              child: GridView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: Get.height * 0.050,
                                        crossAxisCount: 3),
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: Get.height * 0.025),
                                    height: Get.height * 0.050,
                                    decoration: BoxDecoration(
                                        color: AppColor.secondColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        chatBotController.textController.text =
                                            "dry";
                                        chatBotController.submitAnswer();
                                      },
                                      child: const Text("dry"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: Get.height * 0.025),
                                    height: Get.height * 0.050,
                                    decoration: BoxDecoration(
                                        color: AppColor.secondColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        chatBotController.textController.text =
                                            "oily";
                                        chatBotController.submitAnswer();
                                      },
                                      child: const Text("oily"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: Get.width * 0.015),
                                    height: Get.height * 0.050,
                                    decoration: BoxDecoration(
                                        color: AppColor.secondColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        chatBotController.textController.text =
                                            "combination";
                                        chatBotController.submitAnswer();
                                      },
                                      child: const Text("combination"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: Get.height * 0.025),
                                    height: Get.height * 0.050,
                                    decoration: BoxDecoration(
                                        color: AppColor.secondColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        chatBotController.textController.text =
                                            "sensitive";
                                        chatBotController.submitAnswer();
                                      },
                                      child: const Text("sensitive"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: Get.height * 0.020),
                                    height: Get.height * 0.050,
                                    decoration: BoxDecoration(
                                        color: AppColor.secondColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        chatBotController.textController.text =
                                            "large_pores";
                                        chatBotController.submitAnswer();
                                      },
                                      child: const Text("large pores"),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : index == 11
                        ? Container(
                            margin: const EdgeInsets.only(left: 10, top: 5),
                            height: Get.height * 0.12,
                            child: Column(
                              children: [
                                Container(
                                  child: GridView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 10,
                                            mainAxisExtent: Get.height * 0.050,
                                            crossAxisCount: 3),
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Get.height * 0.025),
                                        height: Get.height * 0.050,
                                        decoration: BoxDecoration(
                                            color: AppColor.secondColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: MaterialButton(
                                          onPressed: () {
                                            chatBotController
                                                .textController.text = "brown";
                                            chatBotController.submitAnswer();
                                          },
                                          child: const Text("brown"),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Get.height * 0.025),
                                        height: Get.height * 0.050,
                                        decoration: BoxDecoration(
                                            color: AppColor.secondColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: MaterialButton(
                                          onPressed: () {
                                            chatBotController
                                                .textController.text = "blond";
                                            chatBotController.submitAnswer();
                                          },
                                          child: const Text("blond"),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Get.height * 0.025),
                                        height: Get.height * 0.050,
                                        decoration: BoxDecoration(
                                            color: AppColor.secondColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: MaterialButton(
                                          onPressed: () {
                                            chatBotController
                                                .textController.text = "black";
                                            chatBotController.submitAnswer();
                                          },
                                          child: const Text("black"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : index == 12
                            ? Container(
                                margin: const EdgeInsets.only(left: 10, top: 5),
                                height: Get.height * 0.12,
                                child: Column(
                                  children: [
                                    Container(
                                      child: GridView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 10,
                                                mainAxisExtent:
                                                    Get.height * 0.050,
                                                crossAxisCount: 3),
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: Get.height * 0.025),
                                            height: Get.height * 0.050,
                                            decoration: BoxDecoration(
                                                color: AppColor.secondColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: MaterialButton(
                                              onPressed: () {
                                                chatBotController.textController
                                                    .text = "dry";
                                                chatBotController
                                                    .submitAnswer();
                                              },
                                              child: const Text("dry"),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: Get.height * 0.025),
                                            height: Get.height * 0.050,
                                            decoration: BoxDecoration(
                                                color: AppColor.secondColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: MaterialButton(
                                              onPressed: () {
                                                chatBotController.textController
                                                    .text = "smooth";
                                                chatBotController
                                                    .submitAnswer();
                                              },
                                              child: const Text("smooth"),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: Get.height * 0.025),
                                            height: Get.height * 0.050,
                                            decoration: BoxDecoration(
                                                color: AppColor.secondColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: MaterialButton(
                                              onPressed: () {
                                                chatBotController.textController
                                                    .text = "normal";
                                                chatBotController
                                                    .submitAnswer();
                                              },
                                              child: const Text("normal"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container();
    // : index == 8
    // ? Container(
    //     margin: EdgeInsets.only(left: 10, top: 5),
    //     height: Get.height * 0.12,
    //     child: Column(
    //       children: [
    //         Container(
    //           child: GridView(
    //             physics: NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             gridDelegate:
    //                 SliverGridDelegateWithFixedCrossAxisCount(
    //                     mainAxisSpacing: 10,
    //                     mainAxisExtent: Get.height * 0.050,
    //                     crossAxisCount: 3),
    //             children: [
    //               Container(
    //                 margin: EdgeInsets.only(
    //                     right: Get.height * 0.025),
    //                 height: Get.height * 0.050,
    //                 decoration: BoxDecoration(
    //                     color: AppColor.secondColor,
    //                     borderRadius:
    //                         BorderRadius.circular(20)),
    //                 child: MaterialButton(
    //                   onPressed: () {
    //                     chatBotController.index++;
    //                     chatBotController
    //                         .textController.text = "white";
    //                     chatBotController.submitAnswer();
    //                   },
    //                   child: Text("Male"),
    //                 ),
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   )
    // : Container();
  }
}
