import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Reception extends StatelessWidget {
  var pageDecoration= PageDecoration(
      titleTextStyle:
      PageDecoration().titleTextStyle.copyWith( fontFamily:GoogleFonts. montserrat().fontFamily,color:Colors.black),
      bodyTextStyle:
      PageDecoration().bodyTextStyle.copyWith(fontFamily:GoogleFonts.montserrat().fontFamily,color:Colors.black),);
  List<PageViewModel> getpages() {
    return [
      PageViewModel(
        image: Image.asset('assets/final.jpg'),
        title: 'MA SANTE',
        body: 'Votre santé notre responsabilité ',
        footer: Text(
          " Nous tenant à vous raccourcir les distances et simplifier l’accompagnement patient médecin, votre secret sanitaire et en sécurité avec nous",
          style: TextStyle(color: Colors.black,
              fontFamily:GoogleFonts.montserrat().fontFamily),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
          image: Image.asset('assets/image6.jpg'),
          title: 'NOTRE MISSION  ',
          body: ' Trouvé un médecin et devenu  simple  ',
          footer: Text(
            "Nous faisant tous pour une approche médical fiable et sécurisé le meilleurs medecin et a votre disposition n'importe ou et n'importe quand " ,
            style: TextStyle(color: Colors.black,
            fontFamily:GoogleFonts.montserrat().fontFamily),
          ),
        decoration: pageDecoration,
      ),

      PageViewModel(
          image: Image.asset('assets/image8.jpg'),
          title: 'CONFIDENTIALITÉ',
          body: ' Votre secret est le notre aussi  ',
          footer: Text(
            ' Nous garantissant la confidentialité avec respect du secret médical notre label est votre confort ',
            style: TextStyle(color: Colors.black,
                fontFamily:GoogleFonts.montserrat().fontFamily),
          ),
          decoration: pageDecoration,
      ),
      PageViewModel(
          image: Image.asset('assets/image9.jpg'),
          title: 'COMMENT ÇA MARCHE',
          body: 'Organisez vos soins avec efficacité ',
          footer: Text(
            'Connecté vous, choisissez votre médecin prenez un rendez-vous et envoyer vot rapport en trois clics Simple fiable et rapide ',
            style: TextStyle(color: Colors.black,
                fontFamily:GoogleFonts.montserrat().fontFamily),
          ),
          decoration: pageDecoration,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getpages(),
        done: Text(
          'terminez',
          style: TextStyle(color: Colors.teal,),
        ),
        onDone: () {
          Navigator.of(context).pushNamed("choix");
        },
        next: Text('next'),
      ),
    );
  }
}
