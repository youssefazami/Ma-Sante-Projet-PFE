import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  dynamic password, email;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signin() async {
    dynamic formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print('ok');
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.toString(),
            password: password.toString(),
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
    else return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff344B47), Colors.tealAccent])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Connexion',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decorationColor: Colors.white,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||value==null) {
                          return ' ce champ et obligatoire!!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          password= value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "email",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        iconColor: Colors.white,
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        prefixIconColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||value==null) {
                          return 'ce champs et obligatoire';
                        } else
                          return null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        hintText: "password",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        child: Row(
                          children: [
                            Text(
                              'creer votre compte',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("inscription");
                              },
                              child: const Text(
                                '  inscription ?',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          'confirm',
                          style: TextStyle(fontSize: 15,
                           ),
                        ),
                        onPressed: () async {
                          var user = await signin();
                          print(user);
                          if (user != null) {
                            Navigator.of(context).pushReplacementNamed('authenticate');
                          }else  return null;
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            primary: Colors.transparent,
                            padding: EdgeInsets.only(left: 40, right: 40)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
