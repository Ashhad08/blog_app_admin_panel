import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../configurations/back_end.dart';
import '../configurations/front_end.dart';

class StorageProvider with ChangeNotifier {
  String _downloadUrl = '';

  String get downloadUrl => _downloadUrl;

  Future<void> _uploadFileAndSetURL(
      String filePath, String fileName, String folderName) async {
    File file = File(filePath);
    UploadTask uploadTask =
        BackEndConfigs.kStorage.ref('$folderName/$fileName').putFile(file);

    try {
      await uploadTask.whenComplete(() async {
        _downloadUrl = await uploadTask.snapshot.ref.getDownloadURL();
        notifyListeners();
      });
    } on firebase_core.FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> pickImageWithOptionsAndUpload(
      {required ImageSource source,
      required String folderName,
      required BuildContext context}) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      FrontEndConfigs.showSnackBar(
          context: context, message: 'No image Selected', color: Colors.red);
      return;
    } else {
      FrontEndConfigs.showSnackBar(
          context: context,
          message: 'Wait until Image Shows up',
          color: FrontEndConfigs.kPrimaryColor);
    }
    final path = image.path;
    final name = image.name;

    _uploadFileAndSetURL(path, name, folderName);
  }

  void setDownloadUrlEmpty() {
    _downloadUrl = '';
    notifyListeners();
  }
}
