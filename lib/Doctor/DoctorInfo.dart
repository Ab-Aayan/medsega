import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:star_rating/star_rating.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Chatting/chatting.dart';
import '../Group/helper/helper_function.dart';
import '../TimePicker/utils.dart';

class DoctorAppointment {
  final String doctorId;
  final String doctorName;
  final String userName;
  final DateTime dateTime;

  DoctorAppointment({
    required this.doctorId,
    required this.doctorName,
    required this.userName,
    required this.dateTime,
  });
}

class OPSandukRuit extends StatefulWidget {
  const OPSandukRuit({Key? key}) : super(key: key);

  @override
  State<OPSandukRuit> createState() => _OPSandukRuitState();
}

class _OPSandukRuitState extends State<OPSandukRuit> {
  DateTime dateTime = DateTime.now();
  final DataController controller = DataController();
  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400),
        child: SizedBox(
          height: 310,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28.0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                Center(
                  child: Positioned(
                    left: 60,
                    child: Container(
                      width: 280,
                      height: 230,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/DoctorImg/sdk.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 680,
            decoration: const ShapeDecoration(
              color: Color(0xFF00BCE5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(47),
                  topRight: Radius.circular(47),
                ),
              ),
            ),
          ),
          Positioned(
            top: 22,
            left: 60,
            child: Text(
              'overall 40 years of experience',
              style: GoogleFonts.heebo(
                fontSize: 18,
                color: const Color.fromARGB(223, 255, 255, 255),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              height: 480,
              width: 364,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(47),
                    topRight: Radius.circular(47),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 12),
                    child: Text(
                      'Dr. Sanduk Ruit',
                      style: GoogleFonts.heebo(
                        fontSize: 22,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42.0),
                    child: Text(
                      'Optometrist',
                      style: GoogleFonts.heebo(
                        fontSize: 18,
                        color: const Color(0xFF01821D),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 32,
                      width: 70,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFE500),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('4.9'),
                          ),
                          StarRating(
                            length: 1,
                            rating: 1,
                            starSize: 16,
                            onRaitingTap: (rating) {
                              if (kDebugMode) {
                                print('Clicked rating:');
                              }
                            },
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Maecenas fringilla commodo lacus, a free eleifend said at Tomorrow, if there is no pain, the gate and the arrows will be easy, the land will be easy. Until the end of the life of the hospital, a mass of employees Now to put the laughter again and again, that vol.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.heebo(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book a Date & Time',
                          style: GoogleFonts.heebo(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 110,
                                child: GestureDetector(
                                  onTap: () => Utils.showSheet(
                                    context,
                                    child: buildDateTimePicker(),
                                    onClicked: () {
                                      final value =
                                          DateFormat('MM/dd/yyyy HH:mm')
                                              .format(dateTime);
                                      Utils.showSnackBar(
                                          context, 'Selected "$value"');

                                      Navigator.pop(context);
                                    },
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                'Select',
                                                style: GoogleFonts.heebo(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Spacer(),
                                              const Icon(Icons.calendar_month),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: 180,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          DateFormat('MM/dd/yyyy HH:mm')
                                              .format(dateTime),
                                          style: GoogleFonts.heebo(
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(left: 22.0, top: 18),
                            child: Container(
                              height: 43,
                              width: 153,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFF00A5D9),
                                  width: 1.50,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Send Message',
                                  style: GoogleFonts.heebo(
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(),
                              ),
                            );
                          }),

                      //
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 8),
                        child: GestureDetector(
                          onTap: () async {
                            // Get the doctor ID, doctor name, and user name from somewhere
                            String doctorId =
                                'sanduk_ruit'; // Unique identifier for the doctor
                            String doctorName = 'Dr. Sanduk Ruit';
                            String userName =
                                '${controller.userProfileData['userName']}';

                            // Reference to the Firebase Realtime Database root
                            DatabaseReference databaseRef =
                                FirebaseDatabase.instance.reference();

                            // Store data in Firebase Realtime Database
                            await databaseRef.child('appointments').push().set({
                              'doctorId': doctorId,
                              'doctorName': doctorName,
                              'userName': userName,
                              'dateTime': dateTime.toString(),
                              'status': 'Pending',
                            });

                            // Show a success message or perform any other actions
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Booking Successful'),
                                content: const Text(
                                    'Your appointment has been booked.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            height: 43,
                            width: 131,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A5D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: GoogleFonts.heebo(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: DateTime(DateTime.now().year, 2, 1),
          maximumDate: DateTime.now(),
          use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}

class Tarun extends StatefulWidget {
  const Tarun({super.key});

  @override
  State<Tarun> createState() => _TarunState();
}

class _TarunState extends State<Tarun> {
  DateTime dateTime = DateTime.now();
  final DataController controller = DataController();

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400),
        child: SizedBox(
          height: 310,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28.0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                Center(
                  child: Positioned(
                    left: 60,
                    child: Container(
                      width: 280,
                      height: 230,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/DoctorImg/doctor_1.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 680,
            decoration: const ShapeDecoration(
              color: Color(0xFF00BCE5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(47),
                  topRight: Radius.circular(47),
                ),
              ),
            ),
          ),
          Positioned(
            top: 22,
            left: 60,
            child: Text(
              'overall 14 years of experience',
              style: GoogleFonts.heebo(
                fontSize: 18,
                color: const Color.fromARGB(223, 255, 255, 255),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              height: 480,
              width: 364,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(47),
                    topRight: Radius.circular(47),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 12),
                    child: Text(
                      'Dr. Tarun Giroti',
                      style: GoogleFonts.heebo(
                        fontSize: 22,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42.0),
                    child: Text(
                      'Dental Surgeons',
                      style: GoogleFonts.heebo(
                        fontSize: 18,
                        color: const Color(0xFF01821D),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 32,
                      width: 70,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFE500),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('4.9'),
                          ),
                          StarRating(
                            length: 1,
                            rating: 1,
                            starSize: 16,
                            onRaitingTap: (rating) {
                              if (kDebugMode) {
                                print('Clicked rating:');
                              }
                            },
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Maecenas fringilla commodo lacus, a free eleifend said at Tomorrow, if there is no pain, the gate and the arrows will be easy, the land will be easy. Until the end of the life of the hospital, a mass of employees Now to put the laughter again and again, that vol.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.heebo(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book a Date & Time',
                          style: GoogleFonts.heebo(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 110,
                                child: GestureDetector(
                                  onTap: () => Utils.showSheet(
                                    context,
                                    child: buildDateTimePicker(),
                                    onClicked: () {
                                      final value =
                                          DateFormat('MM/dd/yyyy HH:mm')
                                              .format(dateTime);
                                      Utils.showSnackBar(
                                          context, 'Selected "$value"');

                                      Navigator.pop(context);
                                    },
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                'Select',
                                                style: GoogleFonts.heebo(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Spacer(),
                                              const Icon(Icons.calendar_month),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: 180,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          DateFormat('MM/dd/yyyy HH:mm')
                                              .format(dateTime),
                                          style: GoogleFonts.heebo(
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 18),
                        child: Container(
                          height: 43,
                          width: 153,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF00A5D9),
                              width: 1.50,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Send Message',
                              style: GoogleFonts.heebo(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 8),
                        child: GestureDetector(
                          onTap: () async {
                            // Get the doctor name and user name from somewhere
                            String doctorId =
                                'tarun_giroti'; // Unique identifier for the doctor
                            String doctorName = 'Dr. Tarun Giroti';
                            String userName =
                                '${controller.userProfileData['userName']}';

                            // Reference to the Firebase Realtime Database root
                            DatabaseReference databaseRef =
                                FirebaseDatabase.instance.reference();

                            // Store data in Firebase Realtime Database
                            await databaseRef.child('appointments').push().set({
                              'doctorId': doctorId,
                              'doctorName': doctorName,
                              'userName': userName,
                              'dateTime': dateTime.toString(),
                              'status': 'Pending',
                            });

                            // Show a success message or perform any other actions
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Booking Successful'),
                                content: const Text(
                                    'Your appointment has been booked.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            height: 43,
                            width: 131,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A5D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: GoogleFonts.heebo(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: DateTime(DateTime.now().year, 2, 1),
          maximumDate: DateTime.now(),
          use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}

class Bharat extends StatefulWidget {
  const Bharat({super.key});

  @override
  State<Bharat> createState() => _BharatState();
}

class _BharatState extends State<Bharat> {
  DateTime dateTime = DateTime.now();
  final DataController controller = DataController();

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400),
        child: SizedBox(
          height: 310,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28.0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                Center(
                  child: Positioned(
                    left: 60,
                    child: Container(
                      width: 280,
                      height: 230,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/DoctorImg/men_1.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 680,
            decoration: const ShapeDecoration(
              color: Color(0xFF00BCE5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(47),
                  topRight: Radius.circular(47),
                ),
              ),
            ),
          ),
          Positioned(
            top: 22,
            left: 60,
            child: Text(
              'overall 17 years of experience',
              style: GoogleFonts.heebo(
                fontSize: 18,
                color: const Color.fromARGB(223, 255, 255, 255),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              height: 480,
              width: 364,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(47),
                    topRight: Radius.circular(47),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 12),
                    child: Text(
                      'Dr. Bharat Bhandari.',
                      style: GoogleFonts.heebo(
                        fontSize: 22,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42.0),
                    child: Text(
                      'Urology',
                      style: GoogleFonts.heebo(
                        fontSize: 18,
                        color: const Color(0xFF01821D),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 32,
                      width: 70,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFE500),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('4.9'),
                          ),
                          StarRating(
                            length: 1,
                            rating: 1,
                            starSize: 16,
                            onRaitingTap: (rating) {
                              if (kDebugMode) {
                                print('Clicked rating:');
                              }
                            },
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Maecenas fringilla commodo lacus, a free eleifend said at Tomorrow, if there is no pain, the gate and the arrows will be easy, the land will be easy. Until the end of the life of the hospital, a mass of employees Now to put the laughter again and again, that vol.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.heebo(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book a Date & Time',
                          style: GoogleFonts.heebo(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 110,
                                child: GestureDetector(
                                  onTap: () => Utils.showSheet(
                                    context,
                                    child: buildDateTimePicker(),
                                    onClicked: () {
                                      final value =
                                          DateFormat('MM/dd/yyyy HH:mm')
                                              .format(dateTime);
                                      Utils.showSnackBar(
                                          context, 'Selected "$value"');

                                      Navigator.pop(context);
                                    },
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                'Select',
                                                style: GoogleFonts.heebo(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Spacer(),
                                              const Icon(Icons.calendar_month),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: 180,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          DateFormat('MM/dd/yyyy HH:mm')
                                              .format(dateTime),
                                          style: GoogleFonts.heebo(
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 18),
                        child: Container(
                          height: 43,
                          width: 153,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF00A5D9),
                              width: 1.50,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Send Message',
                              style: GoogleFonts.heebo(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 8),
                        child: GestureDetector(
                          onTap: () async {
                            // Get the doctor name and user name from somewhere
                            String doctorId =
                                'bharat_bhandari.'; // Unique identifier for the doctor
                            String doctorName = 'Dr. Bharat Bhandari.';
                            String userName =
                                '${controller.userProfileData['userName']}';

                            // Reference to the Firebase Realtime Database root
                            DatabaseReference databaseRef =
                                FirebaseDatabase.instance.reference();

                            // Store data in Firebase Realtime Database
                            await databaseRef.child('appointments').push().set({
                              'doctorId': doctorId,
                              'doctorName': doctorName,
                              'userName': userName,
                              'dateTime': dateTime.toString(),
                              'status': 'Pending',
                            });

                            // Show a success message or perform any other actions
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Booking Successful'),
                                content: const Text(
                                    'Your appointment has been booked.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            height: 43,
                            width: 131,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A5D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: GoogleFonts.heebo(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: DateTime(DateTime.now().year, 2, 1),
          maximumDate: DateTime.now(),
          use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}

class Jaiswal extends StatefulWidget {
  const Jaiswal({super.key});

  @override
  State<Jaiswal> createState() => _JaiswalState();
}

class _JaiswalState extends State<Jaiswal> {
  DateTime dateTime = DateTime.now();
  final DataController controller = DataController();

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400),
        child: SizedBox(
          height: 310,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28.0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                Center(
                  child: Positioned(
                    left: 60,
                    child: Container(
                      width: 280,
                      height: 230,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/DoctorImg/femal_1.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 680,
            decoration: const ShapeDecoration(
              color: Color(0xFF00BCE5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(47),
                  topRight: Radius.circular(47),
                ),
              ),
            ),
          ),
          Positioned(
            top: 22,
            left: 60,
            child: Text(
              'overall 7 years of experience',
              style: GoogleFonts.heebo(
                fontSize: 18,
                color: const Color.fromARGB(223, 255, 255, 255),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              height: 480,
              width: 364,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(47),
                    topRight: Radius.circular(47),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 12),
                    child: Text(
                      'Dr. J.P. Jaiswal',
                      style: GoogleFonts.heebo(
                        fontSize: 22,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42.0),
                    child: Text(
                      'cardiologist',
                      style: GoogleFonts.heebo(
                        fontSize: 18,
                        color: const Color(0xFF01821D),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 32,
                      width: 70,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFE500),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('4.9'),
                          ),
                          StarRating(
                            length: 1,
                            rating: 1,
                            starSize: 16,
                            onRaitingTap: (rating) {
                              if (kDebugMode) {
                                print('Clicked rating:');
                              }
                            },
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Maecenas fringilla commodo lacus, a free eleifend said at Tomorrow, if there is no pain, the gate and the arrows will be easy, the land will be easy. Until the end of the life of the hospital, a mass of employees Now to put the laughter again and again, that vol.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.heebo(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book a Date & Time',
                          style: GoogleFonts.heebo(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 110,
                                child: GestureDetector(
                                  onTap: () => Utils.showSheet(
                                    context,
                                    child: buildDateTimePicker(),
                                    onClicked: () {
                                      final value =
                                          DateFormat('MM/dd/yyyy HH:mm')
                                              .format(dateTime);
                                      Utils.showSnackBar(
                                          context, 'Selected "$value"');

                                      Navigator.pop(context);
                                    },
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                'Select',
                                                style: GoogleFonts.heebo(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Spacer(),
                                              const Icon(Icons.calendar_month),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: 180,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          DateFormat('MM/dd/yyyy HH:mm')
                                              .format(dateTime),
                                          style: GoogleFonts.heebo(
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 18),
                        child: Container(
                          height: 43,
                          width: 153,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF00A5D9),
                              width: 1.50,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Send Message',
                              style: GoogleFonts.heebo(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 8),
                        child: GestureDetector(
                          onTap: () async {
                            // Get the doctor name and user name from somewhere
                            String doctorId =
                                'jaiswal'; // Unique identifier for the doctor
                            String doctorName = 'Dr. J.P. Jaiswal';
                            String userName =
                                '${controller.userProfileData['userName']}';

                            // Reference to the Firebase Realtime Database root
                            DatabaseReference databaseRef =
                                FirebaseDatabase.instance.reference();

                            // Store data in Firebase Realtime Database
                            await databaseRef.child('appointments').push().set({
                              'doctorId': doctorId,
                              'doctorName': doctorName,
                              'userName': userName,
                              'dateTime': dateTime.toString(),
                              'status': 'Pending',
                            });

                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Booking Successful'),
                                content: const Text(
                                    'Your appointment has been booked.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            height: 43,
                            width: 131,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A5D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: GoogleFonts.heebo(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: DateTime(DateTime.now().year, 2, 1),
          maximumDate: DateTime.now(),
          use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
