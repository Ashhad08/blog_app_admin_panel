import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/bottom_sheet_container.dart';
import '../../../elements/custom_button.dart';
import '../../../elements/pick_image_placeholder.dart';
import '../../../elements/white_description_text_field.dart';
import '../../../elements/white_title_text_field.dart';

class WriteBlogViewBody extends StatelessWidget {
  const WriteBlogViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
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
                                  // _pickImageWithOptionsAndUpload(
                                  //     ImageSource.camera);
                                  Navigator.pop(context);
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
                                  // _pickImageWithOptionsAndUpload(
                                  //     ImageSource.gallery);
                                  Navigator.pop(context);
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
              child: const PickImagePlaceHolder(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  const WhiteTitleTextField(
                    hintText: 'Blog Title',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const WhiteDescriptionTextField(
                    hintText: 'Write blog description',
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  CustomButton(
                      buttonText: 'Upload Post',
                      height: 46,
                      width: double.infinity,
                      onPressed: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
