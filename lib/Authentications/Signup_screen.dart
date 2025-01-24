// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, camel_case_types, file_names, avoid_print, use_build_context_synchronously, unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strokeheal/Authentications/BezierContainer.dart';
import 'package:strokeheal/Authentications/Login_Screen.dart';
import 'package:strokeheal/Authentications/Model/User_Repository.dart';
import 'package:strokeheal/Authentications/Model/user_model.dart';
import 'package:strokeheal/Widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'IN');
  bool isvisible_Pass = false;
  bool isvisible_Repass = false;

  void passwordVisible_changeStatus() {
    setState(() {
      isvisible_Pass = !isvisible_Pass;
    });
  }

  void re_passwordVisible_changeStatus() {
    setState(() {
      isvisible_Repass = !isvisible_Repass;
    });
  }

  createUserWithEmailAndPassword(nameField, mobileField, emailField) async {
    try {
      log("message ${_emailController.text} ");

      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      User? user = credential.user;

      int User_ID = credential.user.hashCode;

      log("user    ${user}");
      log("User ID ---------- ${User_ID}");

      final _usermodel = UserModel(
          id: User_ID,
          name: nameField,
          mobile_no: mobileField,
          email_id: emailField);

      await _createuser(_usermodel);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        // return _displayErrorMotionToast("Invalid Mobile No.", 'Please check Mobile No.')
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        return _displayErrorMotionToast("Email I'd Alerady exists",
            '${_emailController.text} is Alerady exists');
      }
    } catch (e) {
      print(e);
    }
  }

  // Add User Data on Firebase Data Store using Model or Repository
  final userRepo = Get.put(UserRepository());
  Future<void> _createuser(UserModel user) async {
    await userRepo.CreateUser(context, user);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    //Create user Variable of UserModel

    // final bool isValid_Email = EmailValidator.validate(_emailController.text);

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
                  Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.13, left: width * 0.02),
                    child: const Text(
                      'Create an Account',
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

                  // Username Field
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: height * 0.02),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            enableSuggestions: true,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Enter Full Name',
                              suffixIcon: const Icon(
                                Icons.account_circle_rounded,
                              ),
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
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name is Required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: height * 0.03),
                          InternationalPhoneNumberInput(
                            textFieldController: _mobileController,
                            onInputChanged: (PhoneNumber number) {
                              _phoneNumber = number;
                            },
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.DIALOG,
                                setSelectorButtonAsPrefixIcon: true,
                                leadingPadding: 10),
                            ignoreBlank: false,
                            initialValue: _phoneNumber,
                            inputDecoration: InputDecoration(
                              border: const OutlineInputBorder(),
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
                            ),
                            formatInput: true,
                          ),
                          SizedBox(height: height * 0.03),
                          TextFormField(
                            controller: _emailController,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email ID',
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
                          SizedBox(height: height * 0.03),
                          TextFormField(
                            controller: _passwordController,
                            enableSuggestions: false,
                            obscureText: isvisible_Pass ? false : true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
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
                                icon: Icon(isvisible_Pass
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () => passwordVisible_changeStatus(),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Valid Password";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: height * 0.03),
                          TextFormField(
                            controller: _rePasswordController,
                            enableSuggestions: false,
                            obscureText: isvisible_Repass ? false : true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
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
                                icon: Icon(isvisible_Repass
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    re_passwordVisible_changeStatus(),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Valid Password";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: height * 0.03),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: Size(height * 0.5, width * 0.14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              // _createuser(User);
                              if (_formkey.currentState!.validate()) {
                                if (_passwordController.text.length <= 7 ||
                                    _rePasswordController.text.length <= 7) {
                                  _displayErrorMotionToast("Weak Password",
                                      "Required more than 8 Character Password");
                                }
                                if (_passwordController.text ==
                                    _rePasswordController.text) {
                                  createUserWithEmailAndPassword(
                                      _nameController.text,
                                      _mobileController.text,
                                      _emailController.text);
                                  // _createuser(User);
                                  // nextScreen(context, Home_Screen());
                                } else {
                                  _displayErrorMotionToast(
                                      "Enter Valid Password",
                                      "Enter Same Password !!");
                                }
                              }
                              _nameController.clear();
                              _mobileController.clear();
                              _emailController.clear();
                              _passwordController.clear();
                              _rePasswordController.clear();
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                  letterSpacing: 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Alerady have an Account ?'),
                        TextButton(
                            onPressed: () {
                              nextScreen(context, const LoginPage());
                            },
                            child: const Text('Login'))
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
