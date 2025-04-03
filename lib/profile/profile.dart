import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medsega/Group/Login/login_page.dart';

import '../Group/helper/helper_function.dart';
import '../Group/service/auth_service.dart';

class Profilehome extends StatefulWidget {
  const Profilehome({Key? key}) : super(key: key);

  @override
  State<Profilehome> createState() => _ProfilehomeState();
}

class _ProfilehomeState extends State<Profilehome> {
  AuthService authService = AuthService();
  final DataController controller = DataController();

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 122,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("PROFILE"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          )
        ],
      ),
      body: Builder(
        // Wrap ListView.builder with Builder widget
        builder: (BuildContext context) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              // COLUMN THAT WILL CONTAIN THE PROFILE
              Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${controller.userProfileData['userName']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${controller.userProfileData['email']}',
                  )
                ],
              ),
              const SizedBox(height: 32),

              ...List.generate(
                customListTiles.length,
                (index) {
                  final tile = customListTiles[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      child: ListTile(
                        leading: Icon(tile.icon),
                        title: Text(tile.title),
                        trailing: IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () => tile.onPressed(
                              context), // Pass context to the onPressed callback
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomListTile {
  final IconData icon;
  final String title;
  final Function(BuildContext)
      onPressed; // Update the callback type to accept BuildContext

  CustomListTile({
    required this.icon,
    required this.title,
    required this.onPressed,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Activity",
    onPressed: (BuildContext context) {
      // Accept BuildContext parameter
      print('object');
    },
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Location",
    onPressed: (BuildContext context) {
      // Handle button press for Location tile
    },
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
    onPressed: (BuildContext context) {
      // Handle button press for Notifications tile
    },
  ),
  CustomListTile(
    title: "Logout",
    icon: CupertinoIcons.arrow_right_arrow_left,
    onPressed: (BuildContext context) async {
      final AuthService authService = AuthService();
      await authService.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    },
  ),
];
