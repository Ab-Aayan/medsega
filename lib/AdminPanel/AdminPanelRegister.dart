import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/AdminPanel/AdminPanelDashboard.dart';
import 'package:medsega/AdminPanel/AdminPanelLogin.dart';

import '../Group/widgets/widgets.dart';

class AdminRegisterPage extends StatefulWidget {
  @override
  _AdminRegisterPageState createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _obscureText = true;

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection('admins')
          .doc(userCredential.user!.uid) // Ensure the UID is not null
          .set({
        'uid': userCredential.user!.uid, // Save the UID in the document
        'email': _emailController.text.trim(),
        'name': _nameController.text.trim(),
      });

      // Navigate to the admin dashboard or desired screen
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminDashboard()),
      );
    } catch (e) {
      // Handle registration errors (e.g., email already exists)
      print(e);
    }
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
                  padding: const EdgeInsets.only(left: 4.0, top: 44),
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
              height: 14,
            ),
            Container(
              width: 340,
              height: 634,
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
                    'Admin Panel Register',
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
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: "Enter your Name",
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
                              onPressed: _register,
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
                                text: "Sign In",
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
                                      AdminLoginPage(),
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
