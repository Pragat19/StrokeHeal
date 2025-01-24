// ignore_for_file: body_might_complete_normally_catch_error, avoid_types_as_parameter_names, non_constant_identifier_names, unnecessary_brace_in_string_interps, unused_local_variable, file_names

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strokeheal/Authentications/Model/user_model.dart';

import '../../Widget.dart';
import '../Login_Screen.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  CreateUser(context, UserModel user) async {
    log("------Inside CreateUser----");
    await _db.collection("User_Details").add(user.toJson()).whenComplete(() {
      log("--------User Added----------");
      nextScreen(context, const LoginPage());
    }).catchError((error, StackTrace) {
      log("---------------${error.toString()}------------");
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db
        .collection("User_Details")
        .where("Email_Id", isEqualTo: email)
        .get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    log("USER DATA ----1------- $userData");
    return userData;
  }

  Future<List<UserModel>> allUSer(String email) async {
    final snapshot = await _db.collection("User_Details").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    log("USER DATA -----2------ $userData");
    return userData;
  }
}

// Future<int?> get_CurrentUser_UserId() async {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   User? user = auth.currentUser;
//   String? currentemail = FirebaseAuth.instance.currentUser!.email;

//   try {
//     log("------- get_CurrentUser_UserId ------");
//     QuerySnapshot<Map<String, dynamic>> querysnapshot = await FirebaseFirestore
//         .instance
//         .collection('users')
//         .where("Email_Id", isEqualTo: currentemail)
//         .get();
//     log("Email id ${currentemail}");

//     DocumentSnapshot<Map<String, dynamic>> snapshot = querysnapshot.docs.first;
//     int userfield = snapshot.get('User_Id');
//     log("user id ${userfield}");
//     if (user != null) {
//       return userfield;
//     } else {
//       // If the user is not authenticated, return null
//       return null;
//     }
//   } catch (e) {
//     log("Error ${e}");
//   }
//   return null;
// }

Future<int?> get_CurrentUser_UserId() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  String? currentemail = FirebaseAuth.instance.currentUser!.email;

  try {
    log("------- get_CurrentUser_UserId ------");
    QuerySnapshot<Map<String, dynamic>> querysnapshot = await FirebaseFirestore
        .instance
        .collection('User_Details')
        .where("Email_Id", isEqualTo: currentemail)
        .get();
    log("=========== ${querysnapshot.toString()}");

    if (querysnapshot.docs.isEmpty) {
      // No documents found, handle accordingly
      log("No documents found for email $currentemail");
      return null;
    }

    DocumentSnapshot<Map<String, dynamic>> snapshot = querysnapshot.docs.first;
    int userfield = snapshot.get('User_Id');
    log("user id ${userfield}");

    return userfield;
  } catch (e) {
    log("Error ${e}");
    return null;
  }
}
