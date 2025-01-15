import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool? chat;
  const ChatBubble({super.key, required this.text, this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: chat == true ? Colors.grey[400] : AppColor.secondColor,
        borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(20),
            bottomRight: const Radius.circular(20),
            topLeft: chat == true
                ? const Radius.circular(1)
                : const Radius.circular(20),
            topRight: chat == true
                ? const Radius.circular(20)
                : const Radius.circular(1)),
      ),
      child: Text(text,
          style: TextStyle(
              fontSize: 16, color: chat == false ? Colors.white : null)),
    );
  }
}
