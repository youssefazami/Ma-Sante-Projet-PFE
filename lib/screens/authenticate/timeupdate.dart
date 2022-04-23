import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  DateTime dateTime = DateTime(2022, 4, 24, 12,12 );

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
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
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Mis a jour',
            style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontFamily: GoogleFonts.nunito().fontFamily),
          ),
          SizedBox(
            height: 20,
          ),
          Row(children: [
            Container(
              height: 80,
              child: Card(
                  elevation: 0,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 30),
                    child: Text(
                      'Ajouté une Date',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                    ),
                  ))),
            ),
            SizedBox(
              height: 80,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  '${dateTime.year} /${dateTime.month} /${dateTime.day}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: GoogleFonts.nunito().fontFamily),
                ),
                onPressed: () async {
                  final date = await pickeDte();
                  if (date == null) return;
                  final newDateTime = DateTime(date.year, date.month, date.day);
                  setState(() {
                    dateTime = newDateTime;
                  });
                },
              ),
            ),
          ]),
          SizedBox(
            height: 40,
          ),
          Row(children: [
            Container(
              height: 80,
              child: Card(
                  elevation: 0,
                  margin: EdgeInsets.only(left: 20, right: 30),
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 20),
                      child: Text(
                        'Ajouté une Heure',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  '$hours:$minutes',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: GoogleFonts.nunito().fontFamily),
                ),
                onPressed: () async {
                  final time = await picktime();
                  if (time == null) return;
                  final newDateTime = DateTime(dateTime.year, dateTime.month,
                      dateTime.day, time.hour, time.minute);
                  setState(() {
                    dateTime = newDateTime;
                  });
                },
              ),
            ),
          ]),
          SizedBox(
            height: 40,
          ),
          Text(
            "L'heure et la Date Choisi",
            style: TextStyle(
              fontSize: 20,
              color: Colors.teal,
              fontFamily: GoogleFonts.nunito().fontFamily,
            ),
          ),
          CircleAvatar(
            radius: 180,
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
                radius: 177,
                backgroundColor: Colors.transparent,
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 176,
                        child: CircleAvatar(
                          radius: 174,
                          backgroundColor: Colors.grey[300],
                          child: Column(children: [
                            SizedBox(
                              height: 80,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "la date choisit :",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily),
                                  ),
                                  Card(
                                    child: Text(
                                      "${dateTime.year} /${dateTime.month} /${dateTime.day}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "l' heure choisit :",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16, right: 20),
                                    child: Card(
                                      child: Text(
                                        "$hours:$minutes",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('confirmer'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                              ),
                            )
                          ]),
                        )),
                  ],
                )),
          ),
        ]));
  }

  Future<DateTime?> pickeDte() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.teal, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.teal, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );

  Future<TimeOfDay?> picktime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                // change the border color
                primary: Colors.teal,
                // change the text color
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          );
        },
      );
}
