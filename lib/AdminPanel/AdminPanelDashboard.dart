import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/AdminPanel/Admin/AdminMessage.dart';
import 'package:medsega/Group/helper/helper_function.dart';

import 'Admin/Appoiment.dart';

class AdminDashboard extends StatelessWidget {
  AdminDashboard({super.key});
  final DataController2 controller = DataController2();

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/admin/image.png",
                  width: 52.0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getGreetingMessage(),
                    style: GoogleFonts.heebo(
                      fontSize: 22,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${controller.userProfileData['userName']}',
                    style: GoogleFonts.heebo(
                      fontSize: 18,
                      color: const Color.fromARGB(207, 0, 0, 0),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 20.0,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Appoimenthome(),
                            ),
                          );
                          //
                        },
                        child: SizedBox(
                          width: 160.0,
                          height: 165.0,
                          child: Card(
                            color: const Color.fromARGB(255, 21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Image.asset(
                                    "assets/admin/todo.png",
                                    width: 64.0,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Text(
                                    "Appoiment",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const Text(
                                    "Available 2",
                                    style: TextStyle(
                                      color: Color.fromARGB(221, 255, 255, 255),
                                      fontWeight: FontWeight.w100,
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                      ),
                      InkWell(
                          child: SizedBox(
                            width: 160.0,
                            height: 165.0,
                            child: Card(
                              color: const Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Image.asset(
                                      "assets/admin/msg.png",
                                      width: 64.0,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const Text(
                                      "Message",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text(
                                      "pending 3",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                    )
                                  ],
                                ),
                              )),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminMessage(),
                              ),
                            );
                          }),
                      SizedBox(
                        width: 160.0,
                        height: 165.0,
                        child: Card(
                          color: const Color.fromARGB(255, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Image.asset(
                                  "assets/admin/vd.png",
                                  width: 64.0,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  "Video call",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "12:45",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 165.0,
                        child: Card(
                          color: const Color.fromARGB(255, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Image.asset(
                                  "assets/admin/settings.png",
                                  width: 64.0,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  "Settings",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getGreetingMessage() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    String greetingMessage;

    if (currentHour >= 5 && currentHour < 12) {
      greetingMessage = 'Good morning,';
    } else if (currentHour >= 12 && currentHour < 17) {
      greetingMessage = 'Good afternoon,';
    } else {
      greetingMessage = 'Good evening,';
    }

    return greetingMessage;
  }
}
