import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          const Text("Réseaux"),
          Lottie.asset("assets/networking.json",height: MediaQuery.of(context).size.height*0.5),
        ],
      ),
    );
  }
}
