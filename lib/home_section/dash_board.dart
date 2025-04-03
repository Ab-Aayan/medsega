import 'package:flutter/material.dart';

import '../AdminPanel/Admin/Appoiment.dart';
import '../Doctor/DoctorImageView.dart';
import '../profile/profile.dart';
import 'dash_home.dart';

class DashBoardsec extends StatefulWidget {
  const DashBoardsec({super.key});

  @override
  State<DashBoardsec> createState() => _DashBoardsecState();
}

class _DashBoardsecState extends State<DashBoardsec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: const TabBarView(
            children: [
              DashHome(),
              Appoimenthomeuser(),
              DashHome(),
              Profilehome(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 60,
            child: TabBar(
              tabs: const [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.calendar_month),
                ),
                Tab(
                  icon: Icon(Icons.search),
                ),
                Tab(
                  icon: Icon(Icons.account_box),
                )
              ],
              labelColor: const Color.fromARGB(108, 231, 54, 41),
              unselectedLabelColor: Colors.grey[500],
              indicatorPadding: const EdgeInsets.all(6),
              indicatorWeight: 2.4,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(127, 0, 0, 0),
                    width: 3.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
