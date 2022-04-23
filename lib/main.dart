import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inscrilogin/auth/inscrimed.dart';
import 'package:inscrilogin/respt/choix.dart';
import 'package:inscrilogin/respt/homepage.dart';
import 'package:inscrilogin/auth/unused.dart';
import 'package:inscrilogin/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inscrilogin/respt/reception.dart';
import 'package:inscrilogin/screens/authenticate/acceuil.dart';
import 'package:inscrilogin/screens/authenticate/detai.dart';
import 'package:inscrilogin/screens/authenticate/espacemed.dart';
import 'package:inscrilogin/screens/authenticate/espacep.dart';
import 'package:inscrilogin/screens/authenticate/rdv.dart';
import 'package:inscrilogin/screens/authenticate/timeupdate.dart';



import 'auth/inscription.dart';
import 'auth/listemed.dart';


void main() async {
  bool isLogin;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user= FirebaseAuth.instance.currentUser;
  if(user==null)
    { isLogin=false;}else {isLogin=true;}
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

        home:    Reception(),
      routes: {
        "timeupdate":(context)=>Update(),
        "reception":(context)=>Reception(),
        "inscrimed":(context)=>Inscri1(),
        "homepage":(context)=>Myhome(),
        "login":(context)=>Login(),
        "inscription":(context)=>Inscri(),
        "listemed":(context)=>  HomeScreen(),
        "authenticate":(context)=>Homepage1(),
        "hot":(context)=>Menu(),
         "choix":(context)=>Choix(),
        "detai":(context)=> Medetai(),
        "rdv":(context)=>Rdv(),
        "espacep":(context)=>Espace(),
        "espacemed":(context)=>Monesp(),
      },

      );
  }}