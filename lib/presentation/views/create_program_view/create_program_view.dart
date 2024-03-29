import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import 'layout/body.dart';

class CreateProgramView extends StatelessWidget {
  const CreateProgramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      appBar: AppBar(
        title: const CustomText(
            text: 'Create Program', fontSize: 14, fontWeight: FontWeight.bold),
      ),
      body: const CreateProgramViewBody(),
    );
  }
}
