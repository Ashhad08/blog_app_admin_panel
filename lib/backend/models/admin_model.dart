// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  AdminModel({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
  });

  String? uid;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      };
}
