import 'package:blog_app_admin_panel/backend/models/admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SystemServices {
  Future<void> createNewAdmin(AdminModel adminModel) async {
    DocumentReference _ref = FirebaseFirestore.instance
        .collection('AdminsCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return await _ref.set(adminModel.toJson());
  }
}
