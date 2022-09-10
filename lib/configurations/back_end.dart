import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class BackEndConfigs {
  static CollectionReference<Map<String, dynamic>> kAdminsCollection =
      FirebaseFirestore.instance.collection('AdminsCollection');
  static CollectionReference<Map<String, dynamic>> kBlogCollection =
      FirebaseFirestore.instance.collection('blogsCollection');

  static final firebase_storage.FirebaseStorage kStorage =
      firebase_storage.FirebaseStorage.instance;
}
