import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import 'widgets/program_card.dart';

class ManageProgramsViewBody extends StatelessWidget {
  const ManageProgramsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            ProgramCard(),
            ProgramCard(),
          ],
        ),
      ),
    );
  }
}
