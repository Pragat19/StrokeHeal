// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, file_names, prefer_final_fields

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:strokeheal/Authentications/BezierContainer.dart';
import 'package:strokeheal/Authentications/ForgatePassword.dart';
import 'package:strokeheal/Authentications/Signup_screen.dart';
import 'package:strokeheal/Authentications/Widgets.dart';
import 'package:strokeheal/Authentications/firebase_services.dart';
import 'package:strokeheal/Widget.dart';
import 'package:email_validator/email_validator.dart';

import '../Home/Screens/Stroke_information.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  bool isvisible = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate_pass = false;

  void passwordVisible_changeStatus() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: passwordController.text);
      nextScreen(context, const information_screen());

      log("-----------Login Success ----------------");
    } on FirebaseAuthException catch (e) {
      log("Logggg  ${e.code}");

      // Invalid Details
      if (e.code == 'invalid-credential') {
        log("Invalid User Details");
        return _displayErrorMotionToast(
            "Invalid Details", "Enter Valid Email I'd and Password");
      } else if (e.code == "invalid-email") {
        log("Invalid Email");
        return _displayErrorMotionToast(
            "Invalid Email", "Enter Valid Email I'd.");
      }
    }
  }

  @override
  void initState() {
    super.initState();

    // Set language code (optional)
    FirebaseAuth.instance.setLanguageCode('en');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
        body: SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -width * .5,
              child: const BezierContainer()),
          Positioned(
              top: height * .05,
              right: width * .05,
              child: const Image(
                image: AssetImage("assets/image/Logo.png"),
                height: 50,
                width: 50,
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 145),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'ITCKRIST'),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),

                  SizedBox(
                    height: height * 0.07,
                  ),

                  // Email Field
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Enter Email I'd",
                              labelText: "Email ID",
                              labelStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              suffixIcon: const Icon(
                                Icons.email,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Valid Email ID";
                              }
                              if (EmailValidator.validate(
                                      _emailController.text) ==
                                  false) {
                                _displayErrorMotionToast(
                                    "Invalid Email", "Enter valid Email ID");
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: height * 0.04),
                          TextFormField(
                            controller: passwordController,
                            enableSuggestions: false,
                            obscureText: isvisible ? false : true,
                            obscuringCharacter: '*',
                            // maxLength: 8,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isvisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () => passwordVisible_changeStatus(),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              errorText: _validate_pass
                                  ? "Enter Valid Password"
                                  : null,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: const Text("Forgot Password?"),
                                onPressed: () {
                                  nextScreen(context, const Forgate_Screen());
                                },
                              )
                            ],
                          ),
                          SizedBox(height: height * 0.03),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: Size(width * 0.9, height * 0.07),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              setState(() {
                                passwordController.text.isEmpty ||
                                        passwordController.text.length <= 7
                                    ? _validate_pass = true
                                    : _validate_pass = false;
                              });
                              if (_formkey.currentState!.validate()) {
                                signInWithEmailAndPassword();
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                  letterSpacing: 2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(width * 0.9, height * 0.07),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () async {
                        await FirebaseServices().signInWithGoogle(context);
                        log("${FirebaseAuth.instance.currentUser!.displayName}");
                        // nextScreen(context, const information_screen());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage("assets/image/google.png"),
                            height: 20,
                            width: 20,
                          ),
                          Text(
                            'Log in with Google',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          )
                        ],
                      )),
                  SizedBox(height: height * 0.02),
                  LoginWithFB(context),
                  SizedBox(height: height * 0.02),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an Account ?'),
                        TextButton(
                            onPressed: () {
                              nextScreen(context, const Signup_Page());
                            },
                            child: const Text('Sign UP'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void _displayErrorMotionToast(String title, String discription) {
    MotionToast.error(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(discription),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }
}
