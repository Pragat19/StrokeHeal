// ignore_for_file: camel_case_types, file_names, prefer_final_fields

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class Forgate_Screen extends StatefulWidget {
  const Forgate_Screen({super.key});

  @override
  State<Forgate_Screen> createState() => _Forgate_ScreenState();
}

class _Forgate_ScreenState extends State<Forgate_Screen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      _showResetPasswordSuccessDialog();
    } catch (error) {
      _showErrorDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formkey,
                  child: Column(children: [
                    Image.asset("assets/image/forget_pass.jpg"),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.1),
                      child: SizedBox(
                        width: width * 0.8,
                        child: const Text(
                          'If you forget your account password please write your Email Id',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
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
                            borderSide: const BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red)),
                        suffixIcon: const Icon(
                          Icons.email,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Valid Email ID";
                        }
                        if (EmailValidator.validate(_emailController.text) ==
                            false) {
                          _displayErrorMotionToast(
                              "Invalid Email", "Enter valid Email ID");
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * 0.9, height * 0.07),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _resetPassword();
                        }
                      },
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 26,
                            letterSpacing: 1),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
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

  void _showResetPasswordSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Reset Password"),
          content: Text(
              "Password reset email has been sent to ${_emailController.text}"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("User Not Existes"),
          content:
              Text("User Not Founded for ${_emailController.text} Email ID."),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
