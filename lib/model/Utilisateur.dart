
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messageriemydigitalschool/globale.dart';

class Utilisateur {
  late String id;
  late String nom;
  late String prenom;
  String? pseudo;
  String? avatar;



  Utilisateur(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map ["PRENOM"];
    pseudo = map["PSEUDO"]??"";
    avatar = map["AVATAR"]??defaultImage;
  }

  Utilisateur.empty(){
    id = "";
    nom ="";
    prenom ="";
  }

}