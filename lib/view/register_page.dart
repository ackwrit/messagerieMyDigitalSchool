import 'package:flutter/material.dart';
import 'package:messageriemydigitalschool/controller/firestore_manager.dart';
import 'package:messageriemydigitalschool/globale.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //variable
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController nomController = TextEditingController();


  //méthode
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: bodyPage(),
      )),
    );
  }

  Widget bodyPage(){
    return Column(
      children: [
      TextField(
            controller: mailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.mail),
                hintText: "Entrer votre mail",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                gapPadding: 8,
                borderRadius: BorderRadius.circular(20),
              )

            ),
          ),
        TextField(
          controller: mailController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              hintText: "Entrer votre password",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                gapPadding: 8,
                borderRadius: BorderRadius.circular(20),
              )

          ),
        ),
        TextField(
          controller: mailController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: "Entrer votre prénom",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                gapPadding: 8,
                borderRadius: BorderRadius.circular(20),
              )

          ),
        ),
        TextField(
          controller: mailController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: "Entrer votre nom",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                gapPadding: 8,
                borderRadius: BorderRadius.circular(20),
              )

          ),
        ),

        TextButton(
            onPressed: (){
              FirestoreManager().register(mailController.text, passwordController.text, prenomController.text, nomController.text).then((value){
                setState(() {
                  myUtilisateur = value;
                  Navigator.pushNamed(context, "/dashboard");
                });
              });
            },
            child: const Text("Inscription")
        )

      ],
    );
  }
}
