import 'package:flutter/material.dart';

import '../../elements/custom_text.dart';
import 'layout/body.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(
            text: 'Admin Dashboard', fontSize: 16, fontWeight: FontWeight.w400),
      ),
      body: const AdminDashboardViewBody(),
    );
  }
}
