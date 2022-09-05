import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/bottom_sheet_container.dart';
import '../../../elements/custom_button.dart';
import '../../../elements/custom_text.dart';
import '../../../elements/filled_description_field.dart';
import '../../../elements/pick_image_placeholder.dart';
import '../../../elements/select_date_tile.dart';
import '../../../elements/title_underline_text_field.dart';

class CreateProgramViewBody extends StatelessWidget {
  const CreateProgramViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleUnderLineTextField(),
                  const SizedBox(
                    height: 15,
                  ),
                  SelectDateTile(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      ).then((value) {
                        // _expiryDate = DateFormat("dd-MM-yyyy").format(value!);
                        // setState(() {});
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
                  const FilledDescriptionField()
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
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
