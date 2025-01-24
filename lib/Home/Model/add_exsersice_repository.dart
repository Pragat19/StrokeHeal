// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddExser_Repo extends GetxController {
  static AddExser_Repo get instance => Get.find();
  final CollectionReference form_collection =
      FirebaseFirestore.instance.collection('User_Exsersice_records');
  User? user = FirebaseAuth.instance.currentUser;

// ------------------------Form Submit Function----------------------------

  Future<void> add_Exsersice(
    String userId,
    String productId,
    String current_date,
    String complete_workout_status,
    String start_time,
    String end_time,
    String total_exsercise_time,
  ) async {
    await usersCollection
        .doc(userId)
        .collection('Total Days')
        .doc(productId)
        .set({
      "current_date": current_date,
      "complete_workout_status": complete_workout_status,
      "start_time": start_time,
      "end_time": end_time,
      "total_exsercise_time": total_exsercise_time,
    });
    log("product added to cart");
  }

  final _db = FirebaseFirestore.instance;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('User_Exsersice_records');

  Stream<List<String>> getCartProducts(String userId) {
    return usersCollection
        .doc(userId)
        .collection('User_Exsersice_records')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }
}
