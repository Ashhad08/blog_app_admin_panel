import 'package:flutter/material.dart';

import '../../elements/custom_text.dart';
import 'layout/body.dart';

class WriteBlogView extends StatelessWidget {
  const WriteBlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const CustomText(
            text: 'Write Blog', fontSize: 14, fontWeight: FontWeight.bold),
      ),
      body: WriteBlogViewBody(),
    );
  }
}
