import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../elements/custom_text.dart';
import 'layout/body.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const CustomText(
              text: 'Admin Dashboard',
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        body: const AdminDashboardViewBody(),
      ),
    );
  }
}
