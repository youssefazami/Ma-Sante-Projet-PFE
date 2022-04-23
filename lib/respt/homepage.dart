import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myhome extends StatelessWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF5F5F5),
      child: Column(
          children:<Widget> [
      ClipPath(
      clipper: Myclipper(),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(left:30,top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[ TextButton(onPressed:null,child: Text('MA Sante',style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: GoogleFonts.nunito().fontFamily,
          ),
          )
          ),
           ]
          ),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff344B47), Colors.tealAccent])),
        ),
      ),
      ),
    SizedBox(height: 35,),
    Column(children: [
    ElevatedButton(
      onPressed: (){   Navigator.of(context).pushNamed("inscription");},
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.white,
            primary: Colors.transparent,
            padding: EdgeInsets.only(top:16,left: 150, right: 150,bottom: 16)),
    child: Text(
    "S'inscire",
    style: TextStyle(fontSize: 15,
    fontFamily:GoogleFonts.adamina().fontFamily),)),
      SizedBox(height: 30,),
      ElevatedButton(
          onPressed: (){
            Navigator.of(context).pushNamed("login");
          },
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.white,
              primary: Colors.teal,
              padding: EdgeInsets.only(top: 16,left: 165, right: 165,bottom: 16)),
          child: Text(
              "login",
              style: TextStyle(fontSize: 15,
                  fontFamily:GoogleFonts.adamina().fontFamily))),
    ],
    )
    ]
    )
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
