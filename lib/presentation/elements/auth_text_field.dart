import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    required this.textEditingController,
    required this.textInputType,
    this.isPasswordField,
  }) : super(key: key);
  final String hintText;
  final IconData prefixIcon;
  final Function(String) validator;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool? isPasswordField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: textEditingController,
      obscureText: isPasswordField ?? false,
      validator: (val) => validator(val!),
      style: FrontEndConfigs.kTextStyle.copyWith(
          color: FrontEndConfigs.kSubTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: FrontEndConfigs.kSubTextColor,
            ),
          ),
          hintText: hintText,
          hintStyle: FrontEndConfigs.kTextStyle.copyWith(
              color: FrontEndConfigs.kSubTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          prefixIconColor: FrontEndConfigs.kSubTextColor,
          prefixIcon: Icon(
            prefixIcon,
            color: FrontEndConfigs.kSubTextColor,
          )),
    );
  }
}
