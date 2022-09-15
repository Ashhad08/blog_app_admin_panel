import 'package:blog_app_admin_panel/backend/models/blog_model.dart';
import 'package:blog_app_admin_panel/backend/models/event_model.dart';
import 'package:blog_app_admin_panel/backend/models/program_model.dart';
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

  Future createProgram(ProgramModel programModel) async {
    DocumentReference _ref =
        FirebaseFirestore.instance.collection('programsCollection').doc();
    return await _ref.set(programModel.toJson(_ref.id));
  }

  Future createEvent(EventModel eventModel) async {
    DocumentReference _ref =
        FirebaseFirestore.instance.collection('EventsCollection').doc();
    return await _ref.set(eventModel.toJson(_ref.id));
  }
}
