import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/Group/Login/register.dart';
import '../../AdminPanel/AdminPanelLogin.dart';
import '../../home_section/dash_board.dart';
import '../service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../service/database_service.dart';
import '../helper/helper_function.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = true;
  bool _isLoading = false;
  bool userExists = true;
  String email = "";
  String password = "";
  // Initially password is obscure
  bool _obscureText = true;
  TextEditingController forgetPasswordController = TextEditingController();
  AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext contect) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, top: 54),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminLoginPage(),
                              ),
                            );
                          },
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 28,
                          ),
                          Text(
                            'Welcome Back!',
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
                                image:
                                    AssetImage('assets/images/welcome_bg.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    hintText: "Enter your email",
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },

                                  // check tha validation
                                  validator: (val) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val!)
                                        ? null
                                        : "Please enter a valid email";
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  obscureText: _obscureText,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
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
                                  validator: (val) {
                                    if (val!.length < 6) {
                                      return "Password must be at least 6 characters";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "Forget Password?",
                                    style: GoogleFonts.heebo(
                                      fontSize: 18,
                                      color: const Color.fromARGB(185, 0, 0, 0),
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _bottomSheet(contect);
                                      },
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
                                    width: MediaQuery.of(context).size.width /
                                        1.26,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 15, 20, 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(35.0)),
                                      ),
                                      onPressed: () {
                                        login();
                                      },
                                      child: const Text(
                                        "Sign In",
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
                                              const RegisterPage(),
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
                  ),
                ],
              ),
            ),
    );
  }

  //login on firebase
  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
          // ignore: use_build_context_synchronously
          nextScreenReplace(context, const DashBoardsec());
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  //forget password
  _bottomSheet(contect) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(217, 217, 217, 217),
          body: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 80),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Forget password",
                            style: GoogleFonts.heebo(
                              color: const Color.fromARGB(209, 0, 0, 0),
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Enter your email for the verification proccess, we will send forget link to your email.",
                            style: GoogleFonts.heebo(
                              color: const Color.fromARGB(209, 0, 0, 0),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: forgetPasswordController,
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
                            validator: (val) {
                              if (val!.isNotEmpty) {
                                return null;
                              } else {
                                return "Name cannot be empty";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF00A5D9),
                            child: MaterialButton(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              minWidth:
                                  MediaQuery.of(context).size.width / 1.26,
                              onPressed: () async {
                                var forgetEmail =
                                    forgetPasswordController.text.trim();
                                try {
                                  await FirebaseAuth.instance
                                      .sendPasswordResetEmail(
                                          email: forgetEmail)
                                      .then((value) => {
                                            // ignore: avoid_print
                                            print("Email Send !"),
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                icon: Image.asset(
                                                  "assets/images/tick.png",
                                                  width: 48,
                                                  height: 84,
                                                ),
                                                content: const Text(
                                                  "Password rest request was sent sucessfully, Please check your email to reset your password..",
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          ctx,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const LoginPage(),
                                                          ),
                                                        );
                                                      },
                                                      child: const Text('OK'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          });
                                } on FirebaseAuthException catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(e.message ?? ''),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "Send",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
