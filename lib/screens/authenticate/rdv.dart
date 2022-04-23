import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Rdv extends StatefulWidget {
  final docid;
  final list;
  final medecin;
  List<bool> isSelected = [false];

  Rdv({Key? key, this.docid, this.list, this.medecin}) : super(key: key);

  @override
  State<Rdv> createState() => _RdvState(docid, list, medecin);
}

class _RdvState extends State<Rdv> {
  Future getPosts1() async {
    var firestor = FirebaseFirestore.instance;
    QuerySnapshot vn = await firestor
        .collection('temps de disponibilité')
        .doc('${widget.list['docid']}')
        .collection('temps')
        .get();
    return vn.docs;
  }

  List<bool> isSelected = [true, false, false, false, false, false, false];
  final docid;
  final list;
  final medecin;

  _RdvState(this.docid, this.list, this.medecin);

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
      body: Column(children: [
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
                              widget.list['spécialité'],
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
        Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                child: Text(
              'date et heure de disponibilité',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: GoogleFonts.ubuntu().fontFamily,
              ),
            )),
            Icon(
              Icons.calendar_today,
              color: Colors.teal,
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: getPosts1(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('loading'));
                }
                return Row(children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: ((context, i) {
                            return RDV1(
                              rdv: snapshot.data[i],
                            );
                          })),
                    ),
                  ),
                ]);
              }),
          Container(
            child: Text(
              'A Propot votre medecin',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: GoogleFonts.ubuntu().fontFamily,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 211,
            child: Text(
              widget.list['apropot'],
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: GoogleFonts.nunito().fontFamily,
              ),
            ),
          )
        ])
      ]),
    );
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

class RDV1 extends StatefulWidget {
  final rdv;
  RDV1({Key? key, this.rdv,  }) : super(key: key);

  @override
  State<RDV1> createState() => _RDV1State();
}

class _RDV1State extends State<RDV1> {
 bool isSelected =false;
 var selected;

  @override
  void initState() {
    setState(() {
      selected=widget.rdv['date1'];
      print(selected);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        FilterChip(
          selected: isSelected,
          onSelected: (isSelected1){
            setState(() {
              isSelected=isSelected1;
            }
            );
            print(selected);
            return selected;
          },
          label: Row(children: [
            Text(
              '${widget.rdv['date1']}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ]),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          selectedColor:Colors.teal,
          disabledColor: Colors.grey,
        ),
      ]),
      SizedBox(
        height: 40,
      ),
      Row(children: [
        Column(children: [
          ActionChip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            backgroundColor: Color(0xff95B1B0),
            onPressed: () {
             var v=  selected;
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.white,
                        title: Text(
                          "Voullez vous bien prendre un rendez-vous a l'heure ci desous ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: GoogleFonts.nunito().fontFamily),
                        ),
                        content: SingleChildScrollView(
                            child: ListBody(
                          children: [
                            TextFormField(
                                onSaved: (value) {
                                  selected= value!;
                                },
                                decoration: InputDecoration(
                                  focusColor: Colors.black,
                                  hintStyle: TextStyle(color: Colors.black),
                                  hintText: '${widget.rdv['heure1']}  $v',
                                  prefixIcon: Icon(Icons.access_time_outlined),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.white,
                                  primary: Colors.teal,
                                  padding: EdgeInsets.only(
                                      left: 100,
                                      right: 100,
                                      top: 20,
                                      bottom: 20),
                                ),
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('rdv')
                                      .add({
                                    "heure": widget.rdv['heure1'],
                                    "date": selected,
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          title: Text(
                                            "votre rendez vous et bien enregistré (${widget.rdv['heure1']}${widget.rdv['date1']}, votre medecin va vous contacter le plus proche possible merci d'avoire choisi  ma santé",
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontFamily: GoogleFonts.nunito()
                                                    .fontFamily),
                                          ),
                                        );
                                      });
                                },
                                child: Text('confirmer'))
                          ],
                        )));
                  });
            },
            label: Row(children: [
              Text(
                '${widget.rdv['heure1']}',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ]),
          ),
        ]),
        SizedBox(
          width: 20,
        ),
      ]),
    ]);
  }
}

