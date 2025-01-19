import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  BuildContext? context;
  int currentQuestionIndex = 0;
  int index = 0;

  // List<String> questions = [
  //   "Enter your name",
  //   "Enter your phone Number",
  //   "Enter your tall In CM",
  //   "Enter your weight In KG",
  //   "Enter your Skin color",
  //   "Enter your Skin type",
  //   "Enter your Hair color",
  //   "Enter your Gender",
  //   // "Enter your date of brith",
  // ];
  List<String> questions = [
    "height",
    "weight",
    "calories",
    "carbs",
    "fat",
    "protein",
    "chronicDiseases",
    "makeupFavColor",
    "gender",
    "skinColor",
    "skinType",
    "hairColor",
    "hairType",
  ];
  List<String> emptyQuestions = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  List<String> answers = [];
  bool loading = false;

  List names = ["hello how are you", "hello how are he", "hello how are she"];
  // String _displayedText = '';
  final List _displayedText = [""];
  final String _fullText = 'What is your favorite color?';
  Timer? _timer;
  int questionIndex = 0;

  _startTyping() {
    Future.delayed(const Duration(seconds: 1), () {
      int index = 0;

      _timer = Timer.periodic(const Duration(milliseconds: 75), (timer) {
        if (questionIndex <= 12) {
          if (index < questions[questionIndex].length) {
            emptyQuestions[questionIndex] += questions[questionIndex][index];
            index++;

            update();
          } else {
            timer.cancel(); // Stop the timer when done
          }
        }
      });
    });
  }

  void submitAnswer() {
    String Input = textController.text;
    if (Input.isEmpty) {
      Get.snackbar("Wrong Input", "please enter value");
      return;
    }
    // if (index == 0) {
    //   if (int.tryParse(Input) != null) {
    //     Get.snackbar("Wrong Input", "please enter your name using chars");
    //     return;
    //   }
    // }

    Future.delayed(const Duration(seconds: 1), () {
      questionIndex++;
    });
    _startTyping();

    if (index < 6 && index > 0) {
      if (int.tryParse(Input) == null) {
        Get.snackbar("Wrong Input", "please enter number");
        return;
      }
    }
    index++;
    loading = true;
    update();
    answers.add(textController.text);
    textController.clear();
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    }

    Future.delayed(const Duration(seconds: 1), () {
      loading = false;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent * 3,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCirc,
      );
      update();
    });
    scrollController.animateTo(
      scrollController.position.maxScrollExtent * 3,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCirc,
    );
    update();
  }

  showdata() {
    showDatePicker(
        context: context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
  }

  @override
  void onInit() {
    _startTyping();

    super.onInit();
  }
}
