// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

GroupModel groupModelFromJson(String str) =>
    GroupModel.fromJson(json.decode(str));

String groupModelToJson(GroupModel data) =>
    json.encode(data.toJson(data.groupId.toString()));

class GroupModel {
  GroupModel({
    this.groupId,
    this.adminId,
    this.groupTitle,
    this.groupImage,
    this.groupDescription,
    required this.groupMembers,
  });

  String? groupId;
  String? adminId;
  String? groupTitle;
  String? groupImage;
  String? groupDescription;
  List<String> groupMembers;

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        groupId: json["groupId"],
        adminId: json["adminId"],
        groupTitle: json["groupTitle"],
        groupImage: json["groupImage"],
        groupDescription: json["groupDescription"],
        groupMembers: List<String>.from(json["groupMembers"].map((x) => x)),
      );

  Map<String, dynamic> toJson(String id) => {
        "groupId": id,
        "adminId": FirebaseAuth.instance.currentUser!.uid,
        "groupTitle": groupTitle,
        "groupImage": groupImage,
        "groupDescription": groupDescription,
        "groupMembers": List<dynamic>.from(groupMembers.map((x) => x)),
      };
}
