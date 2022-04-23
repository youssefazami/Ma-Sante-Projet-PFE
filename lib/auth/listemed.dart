import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inscrilogin/auth/profil.dart';
import 'dart:math';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double value = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18.0),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => {
              //Navigator.push(context,
                //  MaterialPageRoute(builder: (builder) => const homescreens()))
            },
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
                      Color(0xfffffffffB288EFF),
                      Colors.purple,
                      Colors.white,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
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
                              CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.grey,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'hamza boulibya',
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
                                onTap: () {},
                                leading: Icon(Icons.home),
                                title: Text(
                                  'home',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: Icon(Icons.article_outlined),
                                title: Text(
                                  'source',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: Icon(Icons.settings),
                                title: Text(
                                  'setting',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: Icon(
                                  Icons.dark_mode_outlined,
                                ),
                                title: Text(
                                  'Dark mode ',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          blurRadius: 0,
                          spreadRadius: 2,
                        )
                      ]),
                  height: 130,
                  margin: EdgeInsets.only(
                    bottom: 10,
                    top: 10,
                    right: 5,
                    left: 5,
                  ),
                  child: Row(
                    children: [Container(
                    )],
                  ),
                );
              })),
    );
  }
}