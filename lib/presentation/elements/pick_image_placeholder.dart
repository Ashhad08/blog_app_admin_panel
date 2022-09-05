import 'package:flutter/material.dart';

class PickImagePlaceHolder extends StatelessWidget {
  const PickImagePlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: const Color(0xffEDEDED),
      child: const Icon(
        Icons.camera_alt_rounded,
        size: 60,
        color: Color(0xff9D9D9D),
      ),
    );
  }
}
