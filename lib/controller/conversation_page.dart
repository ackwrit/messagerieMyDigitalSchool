import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.4,
      child: Column(
        children: [
          const Text("Conversation"),
          Lottie.asset("assets/conversation.json"),
        ],
      ),
    );
  }
}
