// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class Exsersice_Model {
  final String current_date;
  final String complete_workout_status;
  final String start_time;
  final String end_time;
  final int total_exsercise_time;

  const Exsersice_Model({
    required this.current_date,
    required this.complete_workout_status,
    required this.start_time,
    required this.end_time,
    required this.total_exsercise_time,
  });

  toJson() {
    return {
      "current_date": current_date,
      "complete_workout_status": complete_workout_status,
      "start_time": start_time,
      "end_time": end_time,
      "total_exsercise_time": total_exsercise_time,
    };
  }

  factory Exsersice_Model.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Exsersice_Model(
      current_date: data["current_date"],
      complete_workout_status: data["complete_workout_status"],
      start_time: data["start_time"],
      end_time: data["end_time"],
      total_exsercise_time: data["total_exsercise_time"],
    );
  }
}
