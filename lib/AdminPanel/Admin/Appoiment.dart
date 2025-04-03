import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/AdminPanel/Admin/update_info.dart';

import '../../Group/helper/helper_function.dart';

class Appoimenthome extends StatefulWidget {
  const Appoimenthome({super.key});

  @override
  State<Appoimenthome> createState() => _AppoimenthomeState();
}

class _AppoimenthomeState extends State<Appoimenthome> {
  Query dbRef = FirebaseDatabase.instance.ref().child('appointments');

  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('appointments');

  Widget listItem({required Map appointment}) {
    return Container(
      margin: const EdgeInsets.all(18),
      padding: const EdgeInsets.all(22),
      height: 180,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 28.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UpdateRecord(
                          appointmentKey: appointment['key'],
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  reference.child(appointment['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Patient Name: ',
                style: GoogleFonts.heebo(
                  color: const Color.fromARGB(211, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                appointment['userName'].toString().toUpperCase(),
                style: GoogleFonts.heebo(
                  color: Color.fromARGB(141, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Doctor Name: ',
                style: GoogleFonts.heebo(
                  color: const Color.fromARGB(211, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                appointment['doctorName'],
                style: GoogleFonts.heebo(
                  color: Color.fromARGB(141, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Time: ',
                style: GoogleFonts.heebo(
                  color: const Color.fromARGB(211, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                appointment['dateTime'],
                style: GoogleFonts.heebo(
                  color: Color.fromARGB(141, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            appointment['status'],
            style: GoogleFonts.heebo(
              color: const Color.fromARGB(211, 0, 0, 0),
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Schedule',
          style: GoogleFonts.heebo(
            color: const Color.fromARGB(211, 0, 0, 0),
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 78,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map appointment = snapshot.value as Map;
            appointment['key'] = snapshot.key;

            return listItem(appointment: appointment);
          },
        ),
      ),
    );
  }
}

class Appoimenthomeuser extends StatefulWidget {
  const Appoimenthomeuser({super.key});

  @override
  State<Appoimenthomeuser> createState() => _AppoimenthomeuserState();
}

class _AppoimenthomeuserState extends State<Appoimenthomeuser> {
  final DataController controller = DataController();
  Query dbRef = FirebaseDatabase.instance.ref().child('appointments');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('appointments');

  Widget listItem({required Map appointment}) {
    return Container(
      margin: const EdgeInsets.all(18),
      padding: const EdgeInsets.all(22),
      height: 180,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  reference.child(appointment['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Patient Name: ',
                style: GoogleFonts.heebo(
                  color: const Color.fromARGB(211, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                appointment['userName'].toString().toUpperCase(),
                style: GoogleFonts.heebo(
                  color: Color.fromARGB(141, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Doctor Name: ',
                style: GoogleFonts.heebo(
                  color: const Color.fromARGB(211, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                appointment['doctorName'],
                style: GoogleFonts.heebo(
                  color: Color.fromARGB(141, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Time: ',
                style: GoogleFonts.heebo(
                  color: const Color.fromARGB(211, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                appointment['dateTime'],
                style: GoogleFonts.heebo(
                  color: Color.fromARGB(141, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            appointment['status'],
            style: GoogleFonts.heebo(
              color: const Color.fromARGB(211, 0, 0, 0),
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Schedule',
          style: GoogleFonts.heebo(
            color: const Color.fromARGB(211, 0, 0, 0),
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 78,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map appointment = snapshot.value as Map;
            appointment['key'] = snapshot.key;
            return listItem(appointment: appointment);
          },
        ),
      ),
      /*
      body: SizedBox(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef
              .orderByChild('userName')
              .equalTo('${controller.userProfileData['userName']}'),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map appointment = snapshot.value as Map;
            appointment['key'] = snapshot.key;

            return listItem(appointment: appointment);
          },
        ),
      ),*/
    );
  }
}
