import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/Doctor/DoctorImageView.dart';
import 'package:medsega/Doctor/TopDoctorCategories.dart';
import '../components/Catogries.dart';

class DoctorDashBoard extends StatefulWidget {
  const DoctorDashBoard({super.key});

  @override
  State<DoctorDashBoard> createState() => _DoctorDashBoardState();
}

class _DoctorDashBoardState extends State<DoctorDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400),
        child: SizedBox(
          height: 290,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Text(
                  'Dr. Consultation',
                  style: GoogleFonts.heebo(
                    fontSize: 26,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                SliderP(),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 28),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: GoogleFonts.heebo(
                    fontSize: 18,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "See All",
                    style: GoogleFonts.heebo(
                      fontSize: 18,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ),
              ],
            ),
            const Categories(),
            const SizedBox(
              height: 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Doctor',
                  style: GoogleFonts.heebo(
                    fontSize: 18,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 260,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopDoctor(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
