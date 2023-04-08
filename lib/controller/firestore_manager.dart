
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messageriemydigitalschool/model/Utilisateur.dart';

class FirestoreManager{
  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudMessages = FirebaseFirestore.instance.collection("MESSAGES");




  Future<Utilisateur>register(String email, String password, String prenom , String nom) async{
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    String? uid = userCredential.user?.uid;
    if(uid == null){
      return Future.error("error");
    }
    else
      {
        Map<String,dynamic> data = {
          "NOM":nom,
          "PRENOM":prenom,
          "EMAIL": email
        };
        addUser(uid, data);
        return getUser(uid);
      }

  }


  addUser(String uid, Map<String,dynamic> data){
    cloudUsers.doc(uid).set(data);
  }

  Future<Utilisateur> getUser(String uid) async{
    DocumentSnapshot snapshot = await cloudUsers.doc(uid).get();
    return Utilisateur(snapshot);
  }
}