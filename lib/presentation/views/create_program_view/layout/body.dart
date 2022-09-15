import 'package:blog_app_admin_panel/backend/models/program_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../backend/services/admin_services.dart';
import '../../../../configurations/front_end.dart';
import '../../../../providers/storage_provider.dart';
import '../../../elements/bottom_sheet_container.dart';
import '../../../elements/custom_button.dart';
import '../../../elements/custom_text.dart';
import '../../../elements/filled_description_field.dart';
import '../../../elements/pick_image_placeholder.dart';
import '../../../elements/select_date_tile.dart';
import '../../../elements/title_underline_text_field.dart';

class CreateProgramViewBody extends StatefulWidget {
  const CreateProgramViewBody({Key? key}) : super(key: key);

  @override
  State<CreateProgramViewBody> createState() => _CreateProgramViewBodyState();
}

class _CreateProgramViewBodyState extends State<CreateProgramViewBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;
  String _programImage = '';
  String _programDate = "Select Date";

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AdminServices adminServices = AdminServices();
    final storageProvider =
    Provider.of<StorageProvider>(context, listen: false);
    return LoadingOverlay(
      isLoading: isLoading,
      opacity: 0.2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<StorageProvider>(
              builder: ((context, value, child) {
                _programImage = value.downloadUrl;
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10))),
                        builder: (context) {
                          return Container(
                            height: 150,
                            padding: const EdgeInsets.all(20),
                            color: FrontEndConfigs.kWhiteColor,
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      storageProvider
                                          .pickImageWithOptionsAndUpload(
                                        source: ImageSource.camera,
                                        folderName: 'Programs',
                                        context: context,
                                      )
                                          .then((value) =>
                                          Navigator.pop(context));
                                    },
                                    child: const BottomSheetContainer(
                                      text: 'Take Photo',
                                      icon: Icons.camera_alt_outlined,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      storageProvider
                                          .pickImageWithOptionsAndUpload(
                                        source: ImageSource.gallery,
                                        folderName: 'Programs',
                                        context: context,
                                      )
                                          .then((value) =>
                                          Navigator.pop(context));
                                    },
                                    child: const BottomSheetContainer(
                                      text: 'Gallery',
                                      icon: Icons.collections,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: _programImage.isNotEmpty
                      ? CachedNetworkImage(
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: _programImage,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                        Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                    errorWidget: (context, url, error) =>
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 20,
                    ),
                  )
                      : const PickImagePlaceHolder(),
                );
              }),
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
                    date: _programDate,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      ).then((value) {
                        _programDate = DateFormat("EEEE, MMMM d, yyyy").format(value!);
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
                  buttonText: 'Create Program',
                  height: 50,
                  width: double.infinity,
                  onPressed: () async {
                    makeLoadingTrue();
                    FocusManager.instance.primaryFocus!.unfocus();
                    adminServices.createProgram(ProgramModel(
                      programImage: _programImage.toString(),
                      programTitle: _titleController.text,
                      programDescription: _descriptionController.text,
                      programDate: _programDate,
                    )).then((value) {
                      makeLoadingFalse();
                      storageProvider.setDownloadUrlEmpty();
                      _programImage = '';
                      _programDate = 'SelectDate';
                      _titleController.clear();
                      _descriptionController.clear();
                      setState(() {});
                      FrontEndConfigs.showSnackBar(
                          context: context,
                          message: 'Program created successfully',
                          color: FrontEndConfigs.kPrimaryColor);
                    }).onError((error, stackTrace) {
                      makeLoadingFalse();
                      storageProvider.setDownloadUrlEmpty();
                      _programImage = '';
                      _programDate = 'SelectDate';
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

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
