import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inscrilogin/screens/authenticate/rdv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Medetai extends StatefulWidget {
  final docid;
  final list;
  Medetai({Key? key, this.docid, this.list, }) : super(key: key);
  @override
  State<Medetai> createState() => _MedetaiState(docid,list);
}

class _MedetaiState extends State<Medetai> {
  final docid;
  final list;

  _MedetaiState(this.docid, this.list);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff344B47),
          elevation: 0,
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
                          onTap: () async {},
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
        body: Column(children: <Widget>[
          ClipPath(
            clipper: Myclipper(),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: 30, top: 50, right: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(left: 0, top: 0, bottom: 50),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: Image.network(
                              widget.list['imgurl'],
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: null,
                                child: Text(
                                  widget.list['nom'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.lora().fontFamily,
                                  ),
                                ),
                              ),
                              Text(
                                widget.list['spécialité']  ,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.lora().fontFamily,
                                ),
                              )
                            ])
                      ])
                    ]),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff344B47), Colors.tealAccent])),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Adresse du cabinet',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                    ),
                  )),
              SizedBox(
                width: 12,
              ),
              Icon(
                Icons.location_on,
                color: Colors.teal,
              ),
              SizedBox(
                width: 49,
              ),
              IconButton(
                onPressed: () {
                  opennum();
                },
                icon: Icon(
                  Icons.phone_forwarded_outlined,
                  color: Colors.teal,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  openwatssap();
                },
                icon: Icon(
                  Icons.textsms_outlined,
                  color: Colors.teal,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Column(children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                widget.list['adresse'],
                style: TextStyle(
                    fontSize: 16, fontFamily: GoogleFonts.nunito().fontFamily),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.zero,
                  child: Text(
                    'Diplôme et formation',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                    ),
                  )),
              SizedBox(
                width: 12,
              ),
              Icon(
                Icons.filter_9_plus_outlined,
                color: Colors.teal,
              ),
            ]),
            SizedBox(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                ' Lauréate de la faculté de médecine de Rabat'
                "Ancien médecin de l'hôpital Arrazi de Sale"
                "Diplôme de psychiatrie de l'adulte , enfant et adolescent,"
                "Diplôme universitaire d'addictologie",
                style: TextStyle(
                    fontSize: 16, fontFamily: GoogleFonts.nunito().fontFamily),
              ),
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Container(
              width: 400,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                color: Colors.teal,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Rdv(docid:docid,list:list);
                  }));
                  },
                child: Text(
                  'Prenez un rendez-vous',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts. ubuntu().fontFamily),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                ),
              ))
        ]
        )
    );
  }

  void openwatssap() async {
    String num = widget.list['numero'];
    await launch(
        'https://wa.me/$num?text=bonjour je m appelle current user je vous contacte a propots');
  }

  void opennum() async {
    String num = widget.list['numero'];
    await launch('tel://$num');
  }
}

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
