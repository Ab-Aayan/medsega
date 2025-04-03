import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_rating/star_rating.dart';

import 'DoctorInfo.dart';

class TopDoctor extends StatelessWidget {
  const TopDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/images/mess_icon.png",
        "img": "assets/DoctorImg/sdk.png",
        "dname": "Sanduk Ruit",
        "text": "Optometrist",
        "experience": "",
        "doctorinfo": "",
        "messageme": () {
          print('object');
        },
        "press": () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OPSandukRuit(),
            ),
          );
        },
        "booknow": () {
          print('object');
        },
      },
      {
        "icon": "assets/images/mess_icon.png",
        "img": "assets/DoctorImg/doctor_1.png",
        "dname": "Dr. Tarun Giroti",
        "text": "Dental Surgeons",
        "experience": "",
        "doctorinfo": "",
        "messageme": () {
          print('object');
        },
        "press": () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Tarun(),
            ),
          );
        },
        "booknow": () {
          print('object');
        },
      },
      {
        "icon": "assets/images/mess_icon.png",
        "img": "assets/DoctorImg/men_1.png",
        "dname": "Dr. Bharat Bhandari.",
        "text": "Urology",
        "experience": "",
        "doctorinfo": "",
        "messageme": () {
          print('object');
        },
        "press": () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Bharat(),
            ),
          );
        },
        "booknow": () {
          print('object');
        },
      },
      {
        "icon": "assets/images/mess_icon.png",
        "img": "assets/DoctorImg/femal_1.png",
        "dname": "Dr. J.P. Jaiswal",
        "text": "cardiologist",
        "experience": "",
        "doctorinfo": "",
        "messageme": () {},
        "press": () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Jaiswal(),
            ),
          );
        },
        "booknow": () {
          print('object');
        },
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => TopDoctorCard(
              icon: categories[index]["icon"],
              img: categories[index]["img"],
              text: categories[index]["text"],
              dname: categories[index]["dname"],
              press: categories[index]["press"]),
        ),
      ),
    );
  }
}

class TopDoctorCard extends StatefulWidget {
  const TopDoctorCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
    required this.dname,
    required this.img,
  }) : super(key: key);

  final String dname, text, img, icon;
  final GestureTapCallback press;

  @override
  _TopDoctorCardState createState() => _TopDoctorCardState();
}

class _TopDoctorCardState extends State<TopDoctorCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, left: 2, right: 2, bottom: 6),
        child: Container(
          height: 120,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.img),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.dname,
                    style: GoogleFonts.heebo(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.text,
                    style: GoogleFonts.heebo(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  StarRating(
                    length: 4,
                    rating: 3,
                    between: 5,
                    starSize: 26,
                    onRaitingTap: (rating) {
                      print('Clicked rating:');
                    },
                    color: const Color.fromARGB(195, 230, 213, 64),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Image.asset(
                  widget.icon,
                  height: 34,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
