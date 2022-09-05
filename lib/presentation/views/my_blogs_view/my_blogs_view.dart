import 'package:flutter/material.dart';

import '../../elements/custom_text.dart';
import 'layout/body.dart';

class MyBlogsView extends StatelessWidget {
  const MyBlogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            text: 'My Blogs', fontSize: 14, fontWeight: FontWeight.bold),
        actions: [
          Image.asset(
            "assets/icons/chat.png",
            height: 30,
            width: 30,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: const MyBlogsViewBody(),
    );
  }
}
