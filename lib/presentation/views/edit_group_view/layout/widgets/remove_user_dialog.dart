import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';

class RemoveUserDialog extends StatelessWidget {
  const RemoveUserDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 200,
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: FrontEndConfigs.kWhiteColor,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.remove_circle,
                  color: FrontEndConfigs.kPrimaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: 'Remove User',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textColor: FrontEndConfigs.kPrimaryColor,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              maxLines: 3,
              style: FrontEndConfigs.kTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff9D9D9D)),
              decoration: InputDecoration(
                hintText: 'Reason to remove',
                hintStyle: FrontEndConfigs.kTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff9D9D9D)),
                border: InputBorder.none,
                filled: true,
                fillColor: FrontEndConfigs.kScaffoldDefaultColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: FrontEndConfigs
                                        .kSecondaryColor))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const CustomText(
                            text: 'Cancel',
                            fontSize: 12,
                            textColor:
                                FrontEndConfigs.kSecondaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                      buttonText: 'Remove',
                      height: 38,
                      width: double.infinity,
                      onPressed: () {}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
