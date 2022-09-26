import 'dart:io';

import 'package:blog_app_admin_panel/backend/models/event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:loading_overlay/loading_overlay.dart';
import '../../../../backend/services/admin_services.dart';
import '../../../../configurations/back_end.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_button.dart';
import '../../../elements/custom_text.dart';
import '../../../elements/filled_description_field.dart';
import '../../../elements/pick_image_placeholder.dart';
import '../../../elements/select_date_tile.dart';
import '../../../elements/title_underline_text_field.dart';

class CreateEventViewBody extends StatefulWidget {
  const CreateEventViewBody({Key? key}) : super(key: key);

  @override
  State<CreateEventViewBody> createState() => _CreateEventViewBodyState();
}

class _CreateEventViewBodyState extends State<CreateEventViewBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;
  final List<String> _eventImages = [];
  String _eventDate = 'Select Date';
  late DateTime _date;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AdminServices adminServices = AdminServices();
    return LoadingOverlay(
      isLoading: isLoading,
      opacity: 0.2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _titleController.text.isEmpty
                    ? FrontEndConfigs.showSnackBar(
                        context: context,
                        message: 'Enter the event Title before selecting image',
                        color: Colors.red)
                    : pickImagesAndUpload(
                        folderName: _titleController.text,
                        context: context,
                      );
              },
              child: _eventImages.isNotEmpty
                  ? CachedNetworkImage(
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: _eventImages[0],
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 20,
                      ),
                    )
                  : const PickImagePlaceHolder(),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleUnderLineTextField(
                    controller: _titleController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SelectDateTile(
                    date: _eventDate,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      ).then((value) {
                        _date = value ?? DateTime(2019, 1, 15);
                        _eventDate = DateFormat("MMM d, yyyy")
                            .format(value ?? DateTime(2019, 1, 15));
                        setState(() {});
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomText(
                    text: 'DESCRIPTION',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff6A6A6A),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  FilledDescriptionField(
                    controller: _descriptionController,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                  buttonText: 'Create Event',
                  height: 50,
                  width: double.infinity,
                  onPressed: () async {
                    makeLoadingTrue();
                    FocusManager.instance.primaryFocus!.unfocus();
                    await adminServices
                        .createEvent(EventModel(
                            eventGalleryImages: _eventImages,
                            eventTitle: _titleController.text,
                            eventDescription: _descriptionController.text,
                            eventDate: Timestamp.fromDate(_date)))
                        .then((value) {
                      makeLoadingFalse();
                      _eventImages.clear();
                      _eventDate = 'SelectDate';
                      _titleController.clear();
                      _descriptionController.clear();
                      setState(() {});
                      FrontEndConfigs.showSnackBar(
                          context: context,
                          message: 'Event created successfully',
                          color: FrontEndConfigs.kPrimaryColor);
                    }).onError((error, stackTrace) {
                      makeLoadingFalse();
                      _eventImages.clear();
                      _eventDate = 'SelectDate';
                      _titleController.clear();
                      _descriptionController.clear();
                      setState(() {});
                      FrontEndConfigs.showSnackBar(
                          context: context,
                          message: 'Something went wrong',
                          color: Colors.red);
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadImagesAndSetURL(
      List<XFile>? images, String eventName) async {
    makeLoadingTrue();
    for (var e in images!) {
      File file = File(e.path);
      UploadTask uploadTask = BackEndConfigs.kStorage
          .ref('Events/$eventName/${e.name}')
          .putFile(file);

      try {
        await uploadTask.whenComplete(() async {
          _eventImages.add(await uploadTask.snapshot.ref.getDownloadURL());
        });
      } on firebase_core.FirebaseException catch (e) {
        debugPrint(e.message);
      }
    }
    makeLoadingFalse();
  }

  Future<void> pickImagesAndUpload(
      {required String folderName, required BuildContext context}) async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images == null || images.isEmpty) {
      FrontEndConfigs.showSnackBar(
          context: context, message: 'No images Selected', color: Colors.red);
      return;
    } else {
      FrontEndConfigs.showSnackBar(
          context: context,
          message: 'Wait until Image Shows up',
          color: FrontEndConfigs.kPrimaryColor);
    }

    _uploadImagesAndSetURL(images, folderName);
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
