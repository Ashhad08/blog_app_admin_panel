import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import 'layout/body.dart';

class CreateNewGroupView extends StatelessWidget {
  const CreateNewGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      appBar: AppBar(
        title: const CustomText(
            text: 'Create new Group',
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
      body: const CreateNewGroupViewBody(),
    );
  }
}
