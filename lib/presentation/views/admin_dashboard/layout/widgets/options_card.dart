import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 140,
          padding: const EdgeInsets.only(left: 20, top: 30, bottom: 15),
          decoration:
              BoxDecoration(color: FrontEndConfigs.kWhiteColor, boxShadow: [
            BoxShadow(
                color: FrontEndConfigs.kBlackColor.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
                spreadRadius: 2)
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                iconPath,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomText(text: text, fontSize: 14, fontWeight: FontWeight.w400)
            ],
          ),
        ),
      ),
    );
  }
}
