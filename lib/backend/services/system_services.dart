import 'package:blog_app_admin_panel/backend/models/admin_model.dart';
import 'package:blog_app_admin_panel/backend/models/blog_model.dart';
import 'package:blog_app_admin_panel/backend/models/event_model.dart';
import 'package:blog_app_admin_panel/backend/models/group_model.dart';
import 'package:blog_app_admin_panel/backend/models/program_model.dart';
import 'package:blog_app_admin_panel/configurations/back_end.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SystemServices {
  Future<void> createNewAdmin(AdminModel adminModel) async {
    DocumentReference _ref = FirebaseFirestore.instance
        .collection('AdminsCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return await _ref.set(adminModel.toJson());
  }

  Stream<List<BlogModel>> fetchMyBlogs() {
    return BackEndConfigs.kBlogCollection
        .where("adminId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((myBlogsList) => myBlogsList.docs
            .map((singleBlog) => BlogModel.fromJson(singleBlog.data()))
            .toList());
  }

  Stream<List<ProgramModel>> fetchMyPrograms() {
    return BackEndConfigs.kProgramsCollection
        .where("adminId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((myBlogsList) => myBlogsList.docs
            .map((singleBlog) => ProgramModel.fromJson(singleBlog.data()))
            .toList());
  }

  Stream<List<EventModel>> fetchMyUpcomingEvents() {
    return BackEndConfigs.kEventsCollection
        .where("adminId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where(
          "eventDate",
          isGreaterThanOrEqualTo: DateTime.now(),
        )
        .snapshots()
        .map((myBlogsList) => myBlogsList.docs
            .map((singleBlog) => EventModel.fromJson(singleBlog.data()))
            .toList());
  }

  Stream<List<EventModel>> fetchMyPastEvents() {
    return BackEndConfigs.kEventsCollection
        .where("adminId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where(
          "eventDate",
          isLessThan: DateTime.now(),
        )
        .snapshots()
        .map((myBlogsList) => myBlogsList.docs
            .map((singleBlog) => EventModel.fromJson(singleBlog.data()))
            .toList());
  }

  Stream<List<GroupModel>> fetchMyGroups() {
    return BackEndConfigs.kGroupsCollection
        .where("adminId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((myBlogsList) => myBlogsList.docs
            .map((singleBlog) => GroupModel.fromJson(singleBlog.data()))
            .toList());
  }
}
