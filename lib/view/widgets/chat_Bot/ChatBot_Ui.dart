import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Repositories/ApiDataRepository.dart';
import '../../../core/api/errors/error_model.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/Auth/auth_Controller.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppImage.dart';
import '../../../core/functions/requestStatusControl.dart';

import 'Custom_Buble.dart';
import 'chat_options.dart';

class ChatBotUi extends StatelessWidget {
  const ChatBotUi(
      {super.key,
      required this.scrollController,
      required this.currentQuestionIndex,
      required this.loading,
      required this.questions,
      required this.answers,
      required this.secondIndex,
      required this.textController,
      required this.submitAnswer,
      this.widget,
      required this.questionsList,
      required this.questionIndex,
      required this.secondList});
  final ScrollController scrollController;
  final int currentQuestionIndex;
  final bool loading;
  final List<String> questions, answers;
  final int secondIndex;
  final TextEditingController textController;
  final Function submitAnswer;
  final Widget? widget;
  final List questionsList, secondList;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    ApiDataRepository repository = Get.find();

    ErrorModel errorModel;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            // List view controller
            controller: scrollController,
            // itemCount controller
            itemCount: currentQuestionIndex + 1,
            // My Widget controller
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Questions part Start
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // robot picture
                      const CircleAvatar(
                        maxRadius: 20,
                        backgroundImage: AssetImage(AppImage.robot),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        child: // when Question = current Question condition
                            index == currentQuestionIndex
                                // when loading condition
                                ? loading
                                    ? SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: Lottie.asset(
                                          fit: BoxFit.contain,
                                          AppImage.loading,
                                        ),
                                      )
                                    // loading false condition

                                    : ChatBubble(
                                        chat: true, text: questions[index])
                                : ChatBubble(
                                    chat: true, text: questions[index]),
                      ),
                    ],
                  ),
                  // END Questions part
                  // START awnsers part

                  //when awnseres are on select mode condition part start
                  // Main 1
                  if (index > 6)
                    if (index == currentQuestionIndex)
                      if (loading == false)
                        // if (questionsList[questionIndex].length ==
                        // secondList[questionIndex].length)
                        Container(
                            padding:
                                EdgeInsets.only(bottom: Get.height * 0.020),
                            // style for select awnsers mode
                            child: Chose(index: secondIndex)),
                  // START awnsers textField part
                  //contditon to start awnsers after questions and to loop until final question
                  if (index < answers.length)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: ChatBubble(chat: false, text: answers[index]),
                        ),
                        repository.profileModel.avatarUrl == null
                            ? const CircleAvatar(
                                backgroundImage: AssetImage(
                                AppImage.user,
                              ))
                            : CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                    "${repository.profileModel.avatarUrl}")),
                      ],
                    ),
                  // END awnsers textField part
                ],
              );
            },
          ),
        ),
        // TextField show condition
        // Main 2
        if (currentQuestionIndex <= 6)
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: textController,
              onSubmitted: (_) => submitAnswer(),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: AppColor.secondColorLight),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blueAccent)),
                hintStyle: const TextStyle(color: Colors.white),
                hintText: "Enter your answer...",
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      submitAnswer();
                    }),
              ),
            ),
          ),
        // condition to show save button
        // Main 3
        if (secondIndex == 13)
          // condition to show loading animation
          if (loading == false)
            GetBuilder<AuthController>(
              builder: (controller) => handlingRequestStatus(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      vertical: Get.height * 0.010,
                      horizontal: Get.width * 0.020,
                    ),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColor.secondColor,
                            AppColor.primaryColor,
                            Colors.blueGrey
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: MaterialButton(
                        onPressed: () {
                          controller.PatchPhysicalInfo();
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        )),
                  )),
            ),
      ],
    );
  }
}
