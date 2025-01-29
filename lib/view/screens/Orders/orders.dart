import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/Orders/Orders_Controller.dart';
import '../../../controller/homePage_Controller.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersController controller = Get.put(OrdersController());
    HomePageController homePageController = Get.find();
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = homePageController.token!;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Get.height / 2),
                    child: TextFormField(
                      controller: textEditingController,
                    ),
                  ),
                  Container(
                      child: MaterialButton(
                    onPressed: () {
                      homePageController.sendNotification();
                    },
                    child: const Text("send notification"),
                  ))
                ],
              )
              // Container(
              //     margin: EdgeInsets.only(top: Get.height * 0.040),
              //     child: GetBuilder<OrdersController>(
              //       builder: (controller) =>
              //           Text("${controller.displayedText}"),
              //     )),
              // Container(
              //   child: Row(
              //     children: [
              //       Expanded(
              //         flex: 3,
              //         child: Container(
              //           margin: EdgeInsets.only(bottom: Get.height * 0.020),
              //           decoration: BoxDecoration(
              //               border: Border.all(color: Colors.blue),
              //               borderRadius: BorderRadius.circular(20)),
              //           child: TextField(
              //             controller: controller.textController,
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         flex: 1,
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: Colors.amber,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: MaterialButton(
              //             onPressed: () {

              //               // controller.sendForChatBot();
              //             },
              //             child: Icon(Icons.send),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
