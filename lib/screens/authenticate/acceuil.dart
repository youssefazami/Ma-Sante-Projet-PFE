import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inscrilogin/screens/authenticate/detai.dart';
import 'dart:io';
import 'authenticate1.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _HomepageState1();
}


class _HomepageState1 extends State<Homepage1> {
  Future getPosts() async {
    var firestor = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestor.collection('medecin').get();
    return qn.docs;
  }
  Future getPosts1() async {
    var firestor = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestor.collection('tempsvalable').get();
    return qn.docs;
  }


  @override
  void initState(){

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.teal,
          centerTitle: true,

          actions: [
            GestureDetector(
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamed('login');

              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
            ),
          ],

        ),
        drawer: Drawer(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal,
                        Colors.teal,
                        Colors.teal,
                      ],

                    )),
              ),
              SafeArea(
                  child: Container(
                    width: 200.0,
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        DrawerHeader(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Utilisateur courrant',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                            child: ListView(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('espacep');
                                  },
                                  leading: Icon(Icons.home),
                                  title: Text(
                                    'Mon espace',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ListTile(
                                  onTap: () async{
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.of(context).pushNamed('login');

                                  },
                                  leading: Icon(Icons.exit_to_app),
                                  title: Text(
                                    'deconnexion',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: Icon(Icons.settings),
                                  title: Text(
                                    'paramettre',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )),
            ],
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //container qui contient hi olivia
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Ma sante",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 25,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),

                  //search area
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TextField(
                              maxLines: 1,
                              autofocus: false,
                              style: TextStyle(
                                  color: Color(0xff107163), fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search..',
                              ),
                              cursorColor: Color(0xff107163),
                            ),
                          ),
                        ),
                        //box de search
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Container(
                          child: Text(
                            ' Nos Spécialité',
                            style: TextStyle(
                              color: Color(0xff363636),
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        DemoCategories(
                            img: "assets/tooth.png",
                            name: "Dentiste",
                            drCount: "10 Doctors"),
                        DemoCategories(
                            img: "assets/brain.png",
                            name: " neurologue",
                            drCount: "15 Doctors"),
                        DemoCategories(
                            img: "assets/heart.png",
                            name: "cardiologue",
                            drCount: "17 Doctors"),
                        DemoCategories(
                            img: "assets/bone.png",
                            name: "orthopedie",
                            drCount: "24 Doctors"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Container(
                          child: Text(
                            'meilleur raté',
                            style: TextStyle(
                              color: Color(0xff363636),
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      Container(
                        height: 400,
                        child: FutureBuilder(
                            future: getPosts(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(child: Text('loading'));
                              }
                              return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: ((context, i) {
                                    return ListNotes(medecin: snapshot.data[i],docid:snapshot.data[i].id);
                                  }));
                            }),
                      ),
                    ]),
                  )
                ])));
  }
}

class ListNotes extends StatelessWidget {
  final medecin;
  final docid;
  final rdv;

  ListNotes({this.medecin, this.docid, this.rdv});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100 / 2 - 100 / 10),
            child: Image.network(
             "${medecin['imgurl']}",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text('${medecin['nom'] }',style: TextStyle(fontSize: 15),),
                subtitle: Text(
                  '${medecin['spécialité']}       ${medecin['rating']}',
                  style: TextStyle(fontSize: 14),
                ),

                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Medetai(docid:docid,list:medecin);
                    }));
                  },
                  child: Text(
                    'voir le profil',
                    style: TextStyle(fontSize: 15),
                  ),
    style: ElevatedButton.styleFrom(
    shadowColor: Colors.white,
    primary: Colors.teal,
    padding: EdgeInsets.only(left: 15, right: 15)),
    ),
                ),
              )
        ],
      ),
    );
  }
}
