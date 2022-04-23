import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
class Monesp extends StatefulWidget {
  const Monesp({Key? key}) : super(key: key);

  @override
  State<Monesp> createState() => _MonespState();
}

class _MonespState extends State<Monesp> {
  Future getPosts2() async {
    var firestor = FirebaseFirestore.instance;
    QuerySnapshot vn = await firestor.collection('rdv').doc("aSCj72PTKSvkeKTa3PJl").collection('infordv').get();
    return vn.docs;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:  Column(children: [
        SizedBox(height: 20,),
        Text('Mes rendez-vous', style: TextStyle(fontSize: 20,color: Colors.teal,fontFamily: GoogleFonts.nunito().fontFamily),),
        Container(
          height:700,
          child: FutureBuilder(
              future: getPosts2(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: Text('loading'));
                }
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, i) {
                      return ListNotes(rdv1: snapshot.data[i]);
                    }));
              }),
        ),
      ]),
    );
  }
}
class ListNotes extends StatelessWidget {
  final rdv1;
  ListNotes({this.rdv1});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Card(
        semanticContainer: true,
        margin: EdgeInsets.all(17),
        shadowColor: Colors.grey,
           shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
           ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ListTile(
                title: Text('${rdv1['heure']}',style: TextStyle(fontSize: 20,color: Colors.teal),),
                subtitle: Text(
                  '${rdv1['date']}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            Column(
                children:[
                  SizedBox(height: 8,),
                  Text('Monsieur',style: TextStyle(fontSize: 17,
                      color: Colors.black,fontFamily: GoogleFonts.nunito().fontFamily)),
                  SizedBox(height: 10,),
                  Card(
                      margin: EdgeInsets.only(left:50,right: 40),
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                      child: Text(' ${rdv1['patnom']}',style: TextStyle(fontSize: 19,
                          fontWeight:FontWeight.w400,
                          color: Colors.white,fontFamily:GoogleFonts.nunito().fontFamily)))]),
          ],
        ),
      ),
    );
  }
}
