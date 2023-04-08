import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RelaxPage extends StatelessWidget {
  const RelaxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      child: Column(
        children: [
          const Text("Relaxation"),
          Lottie.asset("assets/yoga.json"),
        ],
      ),
    );
  }
}
