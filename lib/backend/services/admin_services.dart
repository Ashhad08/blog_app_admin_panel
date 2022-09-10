import 'package:blog_app_admin_panel/backend/models/blog.dart';
import 'package:blog_app_admin_panel/configurations/back_end.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminServices {
  Future createBlog(BlogModel blogModel) async {
    DocumentReference _ref =
        FirebaseFirestore.instance.collection('blogsCollection').doc();
    return await _ref.set(blogModel.toJson(_ref.id));
  }

  Future deleteBlog({required String blogId}) async {
    return await BackEndConfigs.kBlogCollection.doc(blogId).delete();
  }
}
