// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class Evaluation_Form_Model {
  final String patient_name;
  final String address;
  final String gender;
  final String date_of_birth;
  final int age;
  final double height;
  final double weight;
  final bool medical_condition;
  final String? medical_condition_brife;
  final bool suffered_from_stroke;
  final int? stroke_since_months;
  final bool get_up_from_bed;
  final bool sit_on_bad_without_support;
  final bool stand_from_bed_chair_without_support;
  final String able_to_walk;
  final String use_the_toilet;
  final bool comb_hair_independently;
  final bool eat_food_itSelf;
  final bool dress_ItSelf;

  const Evaluation_Form_Model({
    required this.patient_name,
    required this.address,
    required this.gender,
    required this.date_of_birth,
    required this.age,
    required this.height,
    required this.weight,
    required this.medical_condition,
    required this.medical_condition_brife,
    required this.suffered_from_stroke,
    required this.stroke_since_months,
    required this.get_up_from_bed,
    required this.sit_on_bad_without_support,
    required this.stand_from_bed_chair_without_support,
    required this.able_to_walk,
    required this.use_the_toilet,
    required this.comb_hair_independently,
    required this.eat_food_itSelf,
    required this.dress_ItSelf,
  });

  toJson() {
    return {
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
    };
  }

  factory Evaluation_Form_Model.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Evaluation_Form_Model(
      patient_name: data["patient_name"],
      address: data["address"],
      gender: data["gender"],
      date_of_birth: data["date_of_birth"],
      age: data["age"],
      height: data["height"],
      weight: data["weight"],
      medical_condition: data["medical_condition"],
      medical_condition_brife: data["medical_condition_brife"],
      suffered_from_stroke: data["suffered_from_stroke"],
      stroke_since_months: data["stroke_since_months"],
      get_up_from_bed: data["get_up_from_bed"],
      sit_on_bad_without_support: data["sit_on_bad_without_support"],
      stand_from_bed_chair_without_support:
          data["stand_from_bed_chair_without_support"],
      able_to_walk: data["able_to_walk"],
      use_the_toilet: data["use_the_toilet"],
      comb_hair_independently: data["comb_hair_independently"],
      eat_food_itSelf: data["eat_food_itSelf"],
      dress_ItSelf: data["dress_ItSelf"],
    );
  }
}
