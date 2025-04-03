import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/components/overlap.dart';

class DashHome extends StatefulWidget {
  const DashHome({super.key});

  @override
  State<DashHome> createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400),
        child: SizedBox(
          height: 140,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/Ellipse_1.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.notifications,
                    size: 42,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 24,
                    ),
                    child: Text(
                      'How is your health\ntoday?',
                      style: GoogleFonts.heebo(
                        fontSize: 26,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 24,
                    ),
                    child: Text(
                      'Friday, july 2',
                      style: GoogleFonts.heebo(
                        fontSize: 17,
                        color: const Color.fromARGB(129, 0, 0, 0),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const BotContainer(),
            const AppoimentContainer(),
          ],
        ),
      ),
    );
  }
}
