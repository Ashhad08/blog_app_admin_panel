import 'package:flutter/material.dart';

import 'layout/body.dart';

class EditGroupView extends StatelessWidget {
  const EditGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditGroupViewBody(),
    );
  }
}
