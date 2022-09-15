import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class FilledDescriptionField extends StatelessWidget {
  const FilledDescriptionField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 6,
      style: FrontEndConfigs.kTextStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9D9D9D)),
      decoration: InputDecoration(
        hintText: 'Write a detail description ',
        hintStyle: FrontEndConfigs.kTextStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xff9D9D9D)),
        border: InputBorder.none,
        filled: true,
        fillColor: FrontEndConfigs.kScaffoldDefaultColor,
      ),
    );
  }
}
