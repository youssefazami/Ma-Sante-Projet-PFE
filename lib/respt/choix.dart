import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class Choix extends StatelessWidget {
  const Choix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffF5F5F5),
        child: Column(children: <Widget>[
          ClipPath(
            clipper: Myclipper(),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: 30, top: 50,right: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: null,
                          child: Text(
                            'MA Sante',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                            ),
                          )),
                    ]),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff344B47), Colors.tealAccent])),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('inscription');
            },
            child: Column(children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ('assets/image6.jpg'),
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.circular(10)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.teal,
                ),
                width: 300,
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Consulter en ligne',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                    )),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('inscrimed');
            },
            child: Column(children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ('assets/img1.png'),
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.circular(10)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.teal,
                ),
                width: 300,
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Vous êtes un participant',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                    )),
              ),
            ]),
          )
        ]));
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
