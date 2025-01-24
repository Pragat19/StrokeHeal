// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FormRepository extends GetxController {
  static FormRepository get instance => Get.find();
  final CollectionReference form_collection =
      FirebaseFirestore.instance.collection('Self_Evaluation_Form');
  User? user = FirebaseAuth.instance.currentUser;

// ------------------------Form Submit Function----------------------------

  Future<void> form_Submit(
    String userId,
    String patient_name,
    String address,
    String gender,
    String date_of_birth,
    String age,
    String height,
    String weight,
    String medical_condition,
    String? medical_condition_brife,
    String suffered_from_stroke,
    String? stroke_since_months,
    String get_up_from_bed,
    String sit_on_bad_without_support,
    String stand_from_bed_chair_without_support,
    String able_to_walk,
    String use_the_toilet,
    String comb_hair_independently,
    String eat_food_itSelf,
    String dress_ItSelf,
  ) async {
    await form_collection.doc(userId).set({
      "patient_name": patient_name,
      "address": address,
      "gender": gender,
      "date_of_birth": date_of_birth,
      "age": age,
      "height": height,
      "weight": weight,
      "medical_condition": medical_condition,
      "medical_condition_brife": medical_condition_brife,
      "suffered_from_stroke": suffered_from_stroke,
      "stroke_since_months": stroke_since_months,
      "get_up_from_bed": get_up_from_bed,
      "sit_on_bad_without_support": sit_on_bad_without_support,
      "stand_from_bed_chair_without_support":
          stand_from_bed_chair_without_support,
      "able_to_walk": able_to_walk,
      "use_the_toilet": use_the_toilet,
      "comb_hair_independently": comb_hair_independently,
      "eat_food_itSelf": eat_food_itSelf,
      "dress_ItSelf": dress_ItSelf,
    });
    log("product added to cart");
  }
}
