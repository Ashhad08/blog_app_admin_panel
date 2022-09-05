import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class TitleUnderLineTextField extends StatelessWidget {
  const TitleUnderLineTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: FrontEndConfigs.kTextStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: const Color(0xffC6C6C6)),
      decoration: InputDecoration(
          hintText: 'Large Title',
          hintStyle: FrontEndConfigs.kTextStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: const Color(0xffC6C6C6)),
          border: const UnderlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffE2E2E2)))),
    );
  }
}
