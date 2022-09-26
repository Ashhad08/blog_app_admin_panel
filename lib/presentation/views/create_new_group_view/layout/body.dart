import 'package:blog_app_admin_panel/backend/models/group_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../backend/services/admin_services.dart';
import '../../../../configurations/front_end.dart';
import '../../../../providers/storage_provider.dart';
import '../../../elements/bottom_sheet_container.dart';
import '../../../elements/custom_button.dart';
import '../../../elements/pick_image_placeholder.dart';
import '../../../elements/white_description_text_field.dart';
import '../../../elements/white_title_text_field.dart';

class CreateNewGroupViewBody extends StatefulWidget {
  const CreateNewGroupViewBody({Key? key}) : super(key: key);

  @override
  State<CreateNewGroupViewBody> createState() => _CreateNewGroupViewBodyState();
}

class _CreateNewGroupViewBodyState extends State<CreateNewGroupViewBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;
  String _groupImage = '';

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
                _groupImage = value.downloadUrl;
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
                                            folderName: 'Groups',
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
                                            folderName: 'Groups',
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
                  child: _groupImage.isNotEmpty
                      ? CachedNetworkImage(
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: _groupImage,
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
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  WhiteTitleTextField(
                    hintText: 'Group Title',
                    controller: _titleController,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  WhiteDescriptionTextField(
                    hintText: 'Write group description',
                    controller: _descriptionController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      buttonText: 'Create group ',
                      height: 46,
                      width: double.infinity,
                      onPressed: () async {
                        makeLoadingTrue();
                        FocusManager.instance.primaryFocus!.unfocus();
                        await adminServices
                            .createGroup(GroupModel(
                          groupTitle: _titleController.text,
                          groupDescription: _descriptionController.text,
                          groupImage: _groupImage,
                          groupMembers: [],
                        ))
                            .then((value) {
                          makeLoadingFalse();
                          storageProvider.setDownloadUrlEmpty();
                          _groupImage = '';
                          _titleController.clear();
                          _descriptionController.clear();
                          FrontEndConfigs.showSnackBar(
                              context: context,
                              message: 'Group created successfully',
                              color: FrontEndConfigs.kPrimaryColor);
                        }).onError((error, stackTrace) {
                          makeLoadingFalse();
                          storageProvider.setDownloadUrlEmpty();
                          _groupImage = '';
                          _titleController.clear();
                          _descriptionController.clear();
                          FrontEndConfigs.showSnackBar(
                              context: context,
                              message: 'Something went wrong',
                              color: Colors.red);
                        });
                      })
                ],
              ),
            )
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
