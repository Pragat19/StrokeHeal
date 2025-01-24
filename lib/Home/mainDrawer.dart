// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strokeheal/Authentications/Login_Screen.dart';
import 'package:strokeheal/Authentications/firebase_services.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/Screens/Relaxation.dart';
import 'package:strokeheal/Home/Screens/Reminder.dart';
import 'package:strokeheal/Home/Screens/contactus.dart';
import 'package:strokeheal/Widget.dart';

import 'Screens/Advance_equipment.dart';
import 'Screens/Rehabitation.dart';
import 'Screens/Self_Evaluation.dart';
import 'Screens/Stroke_information.dart';
import 'Screens/call_with_doctor_page.dart';
import 'Screens/nearest_clinic copy.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String userData = "";

  late String currentUserEmail = "${FirebaseAuth.instance.currentUser!.email}";

  @override
  void initState() {
    super.initState();
    retrieveUserData();
  }

  void retrieveUserData() async {
    try {
      // Replace 'User_Details' with your Firestore collection name
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('User_Details')
          .where('Email_Id', isEqualTo: currentUserEmail)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there is only one document with the given email
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            querySnapshot.docs.first;

        // Replace 'Name' with the field you want to retrieve
        String userFieldData = snapshot.get('Name');

        setState(() {
          userData = userFieldData;
          log("$userData");
        });
      } else {
        log('No user found with email: $currentUserEmail');
      }
    } catch (e) {
      log('Error retrieving user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Drawer(
        backgroundColor: Colors.white,
        width: width * 0.7,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: height * 0.3,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: width * 0.05),
                        child:
                            FirebaseAuth.instance.currentUser!.photoURL == null
                                ? const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                        "assets/image/default_blue_user.png"),
                                    radius: 50,
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "${FirebaseAuth.instance.currentUser!.photoURL}"),
                                    radius: 50,
                                  )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.05, top: width * 0.01),
                        child: Text(
                          FirebaseAuth.instance.currentUser!.displayName == null
                              ? userData
                              : "${FirebaseAuth.instance.currentUser!.displayName}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.05,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "${FirebaseAuth.instance.currentUser!.email}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 0.1,
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).stroke_info,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: (() {
                Navigator.of(context).pop();
                nextScreen(context, const information_screen());
              }),
            ),
            ListTile(
                leading: const Icon(Icons.self_improvement),
                iconColor: Colors.black,
                textColor: Colors.black,
                title: Text(
                  translation(context).self_evalu,
                  style: const TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  nextScreen(context, const self_Evaluation_Page());
                }),
            ListTile(
              leading: const Icon(Icons.accessibility),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).rehabitation,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
                nextScreen(context, Rehabitation_page());
              },
            ),
            ListTile(
              leading: const Icon(Icons.airline_seat_recline_extra),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).relax,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
                nextScreen(context, Relaxation_screen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.toll_rounded),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).adv_equip,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
                nextScreen(context, Adv_equipment_screen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).reminder,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
                nextScreen(context, Reminder_Screen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on_sharp),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).clinic_near,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
                nextScreen(context, nearme_Doctor());
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_camera_front_outlined),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).online_consult,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
                nextScreen(context, video_conferance_screen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_support_rounded),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).contact_us,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
                nextScreen(context, contact_screen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text(
                translation(context).logout,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: (() {
                FirebaseServices().signOut();
                Navigator.of(context).pop();
                nextScreen(context, const LoginPage());
              }),
            ),
          ],
        )));
  }
}
