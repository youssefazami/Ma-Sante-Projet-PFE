import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:inscrilogin/screens/authenticate/timeupdate.dart';

import '../../respt/choix.dart';
import '../../respt/reception.dart';

import 'espacemed.dart';

class Espace extends StatefulWidget {
  const Espace({Key? key}) : super(key: key);

  @override
  State<Espace> createState() => _EspaceState();
}

class _EspaceState extends State<Espace> {
  final navigationkey =GlobalKey<CurvedNavigationBarState>();
  int index=2;
  final screens=[
    Monesp(),
    Choix(),
    Update(),

  ];
  final items=<Widget>[
    Icon(Icons.date_range_sharp,size: 25,color: Colors.white,),
    Icon( Icons.home,size: 25,color: Colors.white,),
    Icon( Icons.perm_contact_calendar_outlined,size: 25,color: Colors.white,)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body:  screens[index],
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key:navigationkey,
        buttonBackgroundColor: Colors.blueGrey,
        color: Colors.teal,
        backgroundColor: Colors.transparent,
     height: 55,
        index: index,
        items: items,
        onTap: (index)=>setState(() {
          this.index=index;
        }),

      ),
    );
  }
}
