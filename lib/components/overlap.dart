import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ChattingChatBot/ChatBotHome.dart';
import '../Doctor/DoctorDashBoard.dart';

class BotContainer extends StatelessWidget {
  const BotContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 230,
        child: Stack(
          children: [
            Container(
              height: 180,
              width: 330,
              decoration: ShapeDecoration(
                color: const Color(0x7CE73A14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 48,
                    ),
                    child: Container(
                      width: 117,
                      height: 104,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/cht_1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Ask me anything related\nto your problem.',
                    style: GoogleFonts.heebo(
                      fontSize: 15,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 160,
              top: 137,
              child: Container(
                width: 151,
                height: 57,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 168,
              top: 144,
              child: Container(
                width: 136,
                height: 48,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: const BorderSide(width: 1, color: Color(0xFFF2EEEE)),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatBotHome(),
                      ),
                    );
                  },
                  child: Text(
                    "Let's Chat",
                    style: GoogleFonts.heebo(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppoimentContainer extends StatelessWidget {
  const AppoimentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 230,
        child: Stack(
          children: [
            Container(
              height: 180,
              width: 330,
              decoration: ShapeDecoration(
                color: const Color(0x7CE73A14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 54.0),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/DoctorImg/men_1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CONSULT TOP DOCTORS',
                        style: GoogleFonts.heebo(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Online For Any Health Concern',
                        style: GoogleFonts.heebo(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 160,
              top: 137,
              child: Container(
                width: 151,
                height: 57,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 168,
              top: 144,
              child: Container(
                width: 136,
                height: 50,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: const BorderSide(width: 1, color: Color(0xFFF2EEEE)),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoctorDashBoard(),
                      ),
                    );
                  },
                  child: Text(
                    "Appointment",
                    style: GoogleFonts.heebo(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
