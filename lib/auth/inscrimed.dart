import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Inscri1 extends StatefulWidget {
  const Inscri1({Key? key}) : super(key: key);

  @override
  State<Inscri1> createState() => _Inscri1State();
}

class _Inscri1State extends State<Inscri1> {
  @override
  dynamic nom, password, email,specialite,adresse;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signup() async {
    dynamic formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      print(email);
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3F0D7),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff344B47), Colors.tealAccent])),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 150),
              child: Text(
                'inscription',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.white,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length<4) {
                          return ' C e champ et obligatoire!! ';
                        } else
                          return null;
                      },
                      onSaved: (String? value) {
                        setState(() {
                          nom = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "nom",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 0, color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return ' ce champ et obligatoire!!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          focusColor: Colors.white,
                          hintText: "password",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0,color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 0, color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'ce champ et obligatoire!! ';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        setState(() {
                          email = value!;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "email",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0,color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 0, color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return ' ce champ et obligatoire!!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          specialite = value!;
                        });
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          focusColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "spécialité",
                          prefixIcon: Icon(Icons.location_history),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 0, color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return ' ce champ et obligatoire!!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          adresse = value!;
                        });
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          focusColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "adresse",
                          prefixIcon: Icon(Icons.location_on_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 0, color: Colors.white),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text('si vous avez un compte'),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("login");
                              },
                              child: Text(
                                '  login ?',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        )),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "S'inscire",
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () async {
                          var response = await signup();
                          print(response);
                          if (response != null) {
                            Navigator.of(context).pushReplacementNamed('espacemed');
                          await FirebaseFirestore.instance.collection('medecin').add({
                            "nom": nom,
                            "email": email,
                            "spécialité":specialite,
                            "adresse":adresse,
                          });}
                          else{
                            return null;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            primary: Colors.transparent,
                            padding: EdgeInsets.only(left: 50, right: 50)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}