import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/AdminPanel/AdminPanelDashboard.dart';
import 'package:medsega/AdminPanel/AdminPanelRegister.dart';

import '../Group/widgets/widgets.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Initially password is obscure
  bool _obscureText = true;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // Check if the user is an admin
      bool isAdmin = await isAdminUser(userCredential.user!.uid);
      if (isAdmin) {
        // Navigate to the admin dashboard or desired screen
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminDashboard()),
        );
      } else {
        // Display an error message or handle unauthorized access
      }
    } catch (e) {
      // Handle login errors (e.g., wrong email or password)
      print(e);
    }
  }

  Future<bool> isAdminUser(String uid) async {
    // Query the Firestore collection for the admin with the provided UID
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('admins').doc(uid).get();

    return snapshot.exists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, top: 54),
                  child: Container(
                    width: 120,
                    height: 64,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.fitHeight,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 54.0,
                  ),
                  child: SizedBox(
                    width: 156,
                    height: 42,
                    child: Text(
                      'MedSega',
                      style: GoogleFonts.heebo(
                        fontSize: 32,
                        decoration: TextDecoration.none,
                        color: const Color(0xFF00A5D9),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: 340,
              height: 624,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(217, 217, 217, 217),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 0.1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(44),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    'Admin Panel',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.heebo(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    height: 224,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bgd.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: "Enter your email",
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: "Enter your password",
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text.rich(
                          TextSpan(
                            text: "Forget Password?",
                            style: GoogleFonts.heebo(
                              fontSize: 18,
                              color: const Color.fromARGB(185, 0, 0, 0),
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Material(
                          color: const Color(0xFF00A5D9),
                          elevation: 5,
                          borderRadius: BorderRadius.circular(35),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.26,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35.0)),
                              ),
                              onPressed: () {
                                _login();
                              },
                              child: const Text(
                                "LogIn",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: GoogleFonts.heebo(
                              fontSize: 17,
                              color: Colors.black,
                              //fontStyle: FontStyle.values,
                              fontWeight: FontWeight.w600,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign Up",
                                style: GoogleFonts.heebo(
                                  color: const Color(0xFF00A5D9),
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(
                                      context,
                                      AdminRegisterPage(),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
