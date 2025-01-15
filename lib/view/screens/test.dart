import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon/Repositories/ApiDataRepository.dart';
import 'package:lemon/controller/Stores/storeProfile_Controller.dart';
import 'package:lemon/view/widgets/Store/Custom_ListStoresCategories.dart';
import 'package:lemon/view/widgets/Store/StoreProfile.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/requestStatusControl.dart';
import '../widgets/Store/Custom_ListStoresSkelton.dart';
import '../widgets/Store/Custom_StoreAppBar.dart';
import 'Stores/Store_Profile.dart';

// class TypingEffectScreen extends StatefulWidget {
//   @override
//   _TypingEffectScreenState createState() => _TypingEffectScreenState();
// }

// class _TypingEffectScreenState extends State<TypingEffectScreen> {
//   String _displayedText = '';
//   final String _fullText = 'What is your favorite color?';
//   int _index = 0;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _startTyping();
//   }

//   void _startTyping() {
//     _timer = Timer.periodic(Duration(milliseconds: 150), (timer) {
//       if (_index < _fullText.length) {
//         setState(() {
//           _displayedText += _fullText[_index];
//           _index++;
//         });
//       } else {
//         timer.cancel(); // Stop the timer when done
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel(); // Cancel the timer if the widget is disposed
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Typing Effect Example')),
//       body: Center(
//         child: Text(
//           _displayedText,
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

class TypingEffectScreenState extends GetxController {
  List names = ["hello how are you", "hello how are he", "hello how are she"];
  // String _displayedText = '';
  List _displayedText = [""];
  final String _fullText = 'What is your favorite color?';
  int _index = 0;
  Timer? _timer;

  @override
  void onInit() {
    // _startTyping();

    super.onInit();
  }

  _startTyping(String text) {
    _timer = Timer.periodic(Duration(milliseconds: 75), (timer) {
      if (_index < _fullText.length) {
        _displayedText[0] += text[_index];
        _index++;
        update();
      } else {
        timer.cancel(); // Stop the timer when done
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel(); // Cancel the timer if the widget is disposed

    super.onClose();
  }
}

class test extends StatelessWidget {
  const test({
    super.key,
    // this.controller,
    // required this.statusRequest,
    // required this.tag,
    // required this.imgUrl
  });
  // final ScrollController? controller;
  // final StatusRequest statusRequest;
  // final String tag, imgUrl;
  Widget build(BuildContext context) {
    // Get.put(TypingEffectScreenState());
    return Column(
      children: [
        // if (repository.storeCategories.data != null)
        // const CustomStoreAppBar(),

        SizedBox(
          height: Get.height - 100,
          child: ListView(children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.010, vertical: Get.height * 0.010),
              height: Get.height * 0.1,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.greenAccent,
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.010,
                      ),
                      width: Get.width / 2.5,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Text("All Stores")),
                    ),
                  ),
                  ...List.generate(
                      5,
                      (index) => InkWell(
                          onTap: () {},
                          child: CustomListStoresCategoriesSkelton()))
                ],
              ),
            ),
            ...List.generate(
                3,
                (index) => InkWell(
                      onTap: () {},
                      child: CustomListStoresSkelton(),
                    )),
          ]),
        )
      ],
    );
  }
}
