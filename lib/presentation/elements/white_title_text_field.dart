import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class WhiteTitleTextField extends StatelessWidget {
  const WhiteTitleTextField({Key? key, required this.hintText})
      : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: FrontEndConfigs.kTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xffB4B2B2)),
      decoration: InputDecoration(
          filled: true,
          fillColor: FrontEndConfigs.kWhiteColor,
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText,
          hintStyle: FrontEndConfigs.kTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xffB4B2B2)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          )),
    );
  }
}
