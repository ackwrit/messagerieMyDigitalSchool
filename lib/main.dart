import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messageriemydigitalschool/model/Utilisateur.dart';
import 'package:messageriemydigitalschool/view/dashboard_page.dart';
import 'package:messageriemydigitalschool/view/home_page.dart';
import 'package:messageriemydigitalschool/view/messagerie_page.dart';
import 'package:messageriemydigitalschool/view/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings){
        switch(settings.name){
          case "/": return MaterialPageRoute(builder : (context)=> const HomePage());
          case "/dashboard": return MaterialPageRoute(builder: (context)=>const DashBoard());
          case '/register': return MaterialPageRoute(builder: (context)=>const RegisterPage());
          case 'messagerie':
            Utilisateur moi = settings.arguments as Utilisateur;
            Utilisateur autre = settings.arguments as Utilisateur;
            return MaterialPageRoute(builder: (context)=>MessageriePage(moi: moi,autre: autre,));
          default : return MaterialPageRoute(builder : (context)=> const HomePage());
        }
      },
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );



  }

  authentification(BuildContext context){
    final auth = FirebaseAuth.instance.authStateChanges();
    if(auth == null){
      Navigator.pushNamed(context, "/");
    }
    else
      {
        Navigator.pushNamed(context, "/dashboard");
      }
  }

}


