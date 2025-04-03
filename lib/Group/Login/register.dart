import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/Group/Login/login_page.dart';
import '../../home_section/dash_board.dart';
import '../service/auth_service.dart';
import '../helper/helper_function.dart';
import '../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  bool isLoading = true;
  String ans = "";
  String email = "";
  String password = "";
  String fullName = "";
  // Initially password is obscure
  bool _obscureText = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 28,
                          ),
                          Text(
                            'Register with us!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.heebo(
                              fontSize: 25,
                              color: Colors.black,
                              //fontStyle: FontStyle.values,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Your information is safe with us',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.heebo(
                              fontSize: 18,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            width: 98,
                            height: 98,
                            decoration: BoxDecoration(
                              color:
                                  Colors.black.withOpacity(0.3100000023841858),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: Column(
                              children: [
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
                                    hintText: "Enter your full name",
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      fullName = val;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.isNotEmpty) {
                                      return null;
                                    } else {
                                      return "Name cannot be empty";
                                    }
                                  },
                                ),
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
                                  controller: passwordController,
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
                                const SizedBox(height: 10),
                                TextFormField(
                                  obscureText: _obscureText,
                                  autofocus: false,
                                  controller: confirmPasswordController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    hintText: "Confirm your password",
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
                                const SizedBox(height: 24),
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
                                        if (formKey.currentState!.validate() &&
                                            passwordController.text ==
                                                confirmPasswordController
                                                    .text) {
                                          register();
                                        }
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                              const LoginPage(),
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

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);

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
}
