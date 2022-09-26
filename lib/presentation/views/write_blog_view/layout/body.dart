import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/blog_model.dart';
import '../../../../backend/services/admin_services.dart';
import '../../../../configurations/front_end.dart';
import '../../../../providers/storage_provider.dart';
import '../../../elements/bottom_sheet_container.dart';
import '../../../elements/custom_button.dart';
import '../../../elements/pick_image_placeholder.dart';
import '../../../elements/white_description_text_field.dart';
import '../../../elements/white_title_text_field.dart';

class WriteBlogViewBody extends StatefulWidget {
  const WriteBlogViewBody({Key? key}) : super(key: key);

  @override
  State<WriteBlogViewBody> createState() => _WriteBlogViewBodyState();
}

class _WriteBlogViewBodyState extends State<WriteBlogViewBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;
  String _blogImage = '';

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
      opacity: 0.2,
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: FrontEndConfigs.kScaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<StorageProvider>(
                builder: ((context, value, child) {
                  _blogImage = value.downloadUrl;
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
                                              folderName: 'Blogs',
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
                                              folderName: 'Blogs',
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
                    child: _blogImage.isNotEmpty
                        ? CachedNetworkImage(
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: _blogImage,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    WhiteTitleTextField(
                      controller: _titleController,
                      hintText: 'Blog Title',
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    WhiteDescriptionTextField(
                      controller: _descriptionController,
                      hintText: 'Write blog description',
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    CustomButton(
                        buttonText: 'Upload Post',
                        height: 46,
                        width: double.infinity,
                        onPressed: () async {
                          makeLoadingTrue();
                          FocusManager.instance.primaryFocus!.unfocus();
                          await adminServices
                              .createBlog(BlogModel(
                            blogImage: _blogImage.toString(),
                            blogTitle: _titleController.text,
                            blogDescription: _descriptionController.text,
                          ))
                              .then((value) {
                            makeLoadingFalse();
                            storageProvider.setDownloadUrlEmpty();
                            _blogImage = '';
                            _titleController.clear();
                            _descriptionController.clear();
                            FrontEndConfigs.showSnackBar(
                                context: context,
                                message: 'Blog created successfully',
                                color: FrontEndConfigs.kPrimaryColor);
                          }).onError((error, stackTrace) {
                            makeLoadingFalse();
                            storageProvider.setDownloadUrlEmpty();
                            _blogImage = '';
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
