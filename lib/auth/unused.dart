import 'package:flutter/material.dart';
class Menu extends StatelessWidget {
   const Menu({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
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
              // Navigator.push(context,
                //MaterialPageRoute(builder: (builder) => const homescreens()))
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
       body: Container(color: Colors.teal,)

     );
   }
}




