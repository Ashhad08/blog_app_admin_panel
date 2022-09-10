import 'package:blog_app_admin_panel/backend/models/admin_model.dart';
import 'package:blog_app_admin_panel/backend/models/blog.dart';
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
}
