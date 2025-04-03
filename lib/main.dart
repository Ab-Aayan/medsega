import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medsega/Group/Login/login_page.dart';
import 'package:medsega/Group/shared/constants.dart';
import 'package:medsega/SplashScreen/onbording.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'Group/helper/helper_function.dart';
import 'home_section/dash_board.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const CloseSection()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              child: Lottie.asset('assets/images/lf20_zfvn7pa1.json'),
            ),
            if (defaultTargetPlatform == TargetPlatform.iOS)
              const CupertinoActivityIndicator(
                color: Colors.white,
                radius: 20,
              )
            else
              SizedBox(
                height: 154,
                child: Lottie.asset('assets/images/lf20_sjcbakkb.json'),
              ),
            const SizedBox(
              height: 80,
            ),
            Text(
              'Version 1.1',
              textAlign: TextAlign.center,
              style: GoogleFonts.heebo(
                fontSize: 18,
                color: const Color.fromARGB(181, 0, 0, 0),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CloseSection extends StatefulWidget {
  const CloseSection({super.key});

  @override
  State<CloseSection> createState() => _CloseSectionState();
}

class _CloseSectionState extends State<CloseSection> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const DashBoardsec() : const LoginPage(),
    );
  }
}
