import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/Auth/auth_Controller.dart';
import '../../../controller/ChatBot/chatBot_Controller.dart';
import '../../../core/constant/AppColor.dart';
import '../../widgets/chat_Bot/ChatBot_Ui.dart';

class physicalInfo extends StatelessWidget {
  const physicalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(ChatBotController());
    return GetBuilder<ChatBotController>(
      builder: (controller) => Scaffold(
          backgroundColor: AppColor.primaryColor,
          appBar: AppBar(
              backgroundColor: AppColor.secondColor,
              // info
              title: const Text("Your Info")),
          body: ChatBotUi(
            scrollController: controller.scrollController,
            currentQuestionIndex: controller.currentQuestionIndex,
            loading: controller.loading,
            questions: controller.emptyQuestions,
            answers: controller.answers,
            secondIndex: controller.index,
            textController: controller.textController,
            submitAnswer: () {
              controller.submitAnswer();
            },
            questionsList: controller.questions,
            secondList: controller.emptyQuestions,
            questionIndex: controller.questionIndex,
          )

          //  Column(

          //   // Container(
          //   //         width: Get.width,
          //   //         height: Get.height - 80,
          //   //         child: ChatBotUi(
          //   //             scrollController: chatBot_Controller.scrollController,
          //   //             currentQuestionIndex:
          //   //                 chatBot_Controller.currentQuestionIndex,
          //   //             loading: chatBot_Controller.loading,
          //   //             questions: chatBot_Controller.questions,
          //   //             answers: chatBot_Controller.answers,
          //   //             secondIndex: chatBot_Controller.index,
          //   //             textController: chatBot_Controller.textController,
          //   //             submitAnswer: chatBot_Controller.submitAnswer),
          //   //       )

          //   children: [
          //     Expanded(
          //       child: ListView.builder(
          //         // List view controller
          //         controller: controller.scrollController,
          //         // itemCount controller
          //         itemCount: controller.currentQuestionIndex + 1,
          //         // My Widget controller
          //         itemBuilder: (context, index) {
          //           return Column(
          //             children: [
          //               // Questions part Start
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 children: [
          //                   // robot picture
          //                   const CircleAvatar(
          //                     maxRadius: 20,
          //                     backgroundImage: AssetImage(AppImage.robot),
          //                   ),
          //                   Container(
          //                     margin: const EdgeInsets.only(left: 10, top: 10),
          //                     child: // when Question = current Question condition
          //                         index == controller.currentQuestionIndex
          //                             // when loading condition
          //                             ? controller.loading
          //                                 ? SizedBox(
          //                                     height: 70,
          //                                     width: 70,
          //                                     child: Lottie.asset(
          //                                       fit: BoxFit.contain,
          //                                       AppImage.loading,
          //                                     ),
          //                                   )
          //                                 // loading false condition
          //                                 : ChatBubble(
          //                                     chat: true,
          //                                     text: controller.questions[index])
          //                             : ChatBubble(
          //                                 chat: true,
          //                                 text: controller.questions[index]),
          //                   ),
          //                 ],
          //               ),
          //               // END Questions part
          //               // START awnsers part

          //               //when awnseres are on select mode condition part start
          //               if (index > 6)
          //                 if (index == controller.currentQuestionIndex)
          //                   if (controller.loading == false)
          //                     Container(
          //                         padding:
          //                             EdgeInsets.only(bottom: Get.height * 0.020),
          //                         // style for select awnsers mode
          //                         child: Chose(index: controller.index)),
          //               // START awnsers textField part
          //               //contditon to start awnsers after questions and to loop until final question
          //               if (index < controller.answers.length)
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children: [
          //                     Container(
          //                       margin: const EdgeInsets.only(
          //                         right: 10,
          //                       ),
          //                       child: ChatBubble(
          //                           chat: false, text: controller.answers[index]),
          //                     ),
          //                     const CircleAvatar(
          //                       backgroundImage: AssetImage(AppImage.user),
          //                     ),
          //                   ],
          //                 ),
          //               // END awnsers textField part
          //             ],
          //           );
          //         },
          //       ),
          //     ),
          //     // TextField show condition
          //     if (controller.currentQuestionIndex <= 6)
          //       Container(
          //         padding: const EdgeInsets.all(8.0),
          //         child: TextField(
          //           style: const TextStyle(color: Colors.white),
          //           controller: controller.textController,
          //           onSubmitted: (_) => controller.submitAnswer(),
          //           decoration: InputDecoration(
          //             focusedBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(20),
          //               borderSide:
          //                   const BorderSide(color: AppColor.secondColorLight),
          //             ),
          //             border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(20),
          //                 borderSide: const BorderSide(color: Colors.blueAccent)),
          //             hintStyle: const TextStyle(color: Colors.white),
          //             hintText: "Enter your answer...",
          //             suffixIcon: IconButton(
          //                 icon: const Icon(
          //                   Icons.send,
          //                   color: Colors.white,
          //                 ),
          //                 onPressed: controller.submitAnswer),
          //           ),
          //         ),
          //       ),
          //     // condition to show save button
          //     if (controller.index == 13)
          //       // condition to show loading animation
          //       if (controller.loading == false)
          //         GetBuilder<Auth_Controller>(
          //           builder: (controller) => handlingRequestStatus(
          //               statusRequest: controller.statusRequest,
          //               widget: Container(
          //                 width: double.infinity,
          //                 margin: EdgeInsets.symmetric(
          //                   vertical: Get.height * 0.010,
          //                   horizontal: Get.width * 0.020,
          //                 ),
          //                 decoration: BoxDecoration(
          //                     gradient: const LinearGradient(
          //                       colors: [
          //                         AppColor.secondColor,
          //                         AppColor.primaryColor,
          //                         Colors.blueGrey
          //                       ],
          //                     ),
          //                     borderRadius: BorderRadius.circular(20)),
          //                 child: MaterialButton(
          //                     onPressed: () {
          //                       controller.PatchPhysicalInfo();
          //                     },
          //                     child: const Text(
          //                       "Save",
          //                       style: TextStyle(color: Colors.white),
          //                     )),
          //               )),
          //         ),
          //   ],
          // ),
          ),
    );
  }
}
