// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final int? id;
  final String name;
  final String mobile_no;
  final String email_id;

  const UserModel({
    this.id,
    required this.name,
    required this.mobile_no,
    required this.email_id,
  });

  toJson() {
    return {
      "User_Id": id,
      "Name": name,
      "Mobile_No": mobile_no,
      "Email_Id": email_id,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: data["User_Id"],
      name: data["Name"],
      mobile_no: data["Mobile_No"],
      email_id: data["Email_Id"],
    );
  }
}
