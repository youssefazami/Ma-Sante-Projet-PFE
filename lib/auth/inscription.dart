import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Inscri extends StatefulWidget {
  const Inscri({Key? key}) : super(key: key);

  @override
  State<Inscri> createState() => _InscriState();
}

class _InscriState extends State<Inscri> {
  @override
  dynamic nom, password, email;
  File? _pikedImage;
  var url;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signup() async {
    dynamic formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.toString(),
            password: password.toString()
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
      backgroundColor: Color(0xffF1F1E6),
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 80,
                left: 150,
              ),
              child: Text(
                'inscription',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.black,
                  color: Colors.teal,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left:100,right: 30),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 64,
                        backgroundImage:
                            _pikedImage == null ? null : FileImage(_pikedImage!),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 120,
                    child: RawMaterialButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15.0),
                      elevation: 10,
                      fillColor: Colors.teal,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('ajoute une image'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            var piked = await ImagePicker()
                                                .getImage(
                                                    source: ImageSource.camera);
                                            if (piked != null) {
                                              _pikedImage = File(piked.path);
                                              var nameimage =
                                                  basename(piked.path);
                                              var ref = FirebaseStorage.instance
                                                  .ref("images")
                                                  .child("$nameimage");
                                              await ref.putFile(_pikedImage!);
                                              url = await ref.getDownloadURL();
                                            } else {
                                              print('null');
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(Icons.camera)),
                                              Text('camera')
                                            ],
                                          )),
                                      InkWell(
                                          onTap: () async {
                                            var piked = await ImagePicker()
                                                .getImage(
                                                source: ImageSource.gallery);
                                            if (piked != null) {
                                              _pikedImage = File(piked.path);
                                              var nameimage =
                                              basename(piked.path);
                                              var ref = FirebaseStorage.instance
                                                  .ref("images")
                                                  .child("$nameimage");
                                              await ref.putFile(_pikedImage!);
                                              url = await ref.getDownloadURL();
                                            } else {
                                              print('null');
                                            }
                                          },
                                          child: Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.image)),
                                          Text('galery')
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(30),
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
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
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "nom",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.teal),
                                borderRadius: BorderRadius.circular(15))),
                      ),
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
                          password = value!;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          hintStyle: TextStyle(color: Colors.black),
                          hintText: "password",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.teal),
                            borderRadius: BorderRadius.circular(15),
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
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.teal),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              'si vous avez un compte',
                              style: TextStyle(fontSize: 15),
                            ),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      child: ElevatedButton(
                        child: Text(
                          "S'inscire",
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () async {
                           signup();
                            Navigator.of(context)
                                .pushReplacementNamed('authenticate');
                            await FirebaseFirestore.instance
                                .collection('patient')
                                .add({
                              "nom": nom,
                              "email": email,
                            });
                          }
                        ,
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.white,
                          primary: Colors.teal,
                          padding: EdgeInsets.only(left: 100, right: 100),
                        ),
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
