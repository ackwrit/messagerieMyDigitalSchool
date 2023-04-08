import 'package:flutter/material.dart';
import 'package:messageriemydigitalschool/model/Utilisateur.dart';
class MessageriePage extends StatefulWidget {
  Utilisateur moi;
  Utilisateur autre;
  MessageriePage({Key? key, required Utilisateur this.moi,required Utilisateur this.autre}) : super(key: key);

  @override
  State<MessageriePage> createState() => _MessageriePageState();
}

class _MessageriePageState extends State<MessageriePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
