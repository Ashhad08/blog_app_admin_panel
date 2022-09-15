import 'package:blog_app_admin_panel/backend/models/program_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/services/system_services.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/program_card.dart';

class ManageProgramsViewBody extends StatelessWidget {
  const ManageProgramsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: [ProgramModel()],
      value: SystemServices().fetchMyPrograms(),
      builder: (context, child) {
        List<ProgramModel> _myProgramsList =
            context.watch<List<ProgramModel>>();
        if (_myProgramsList.isEmpty) {
          return const SizedBox(
            height: 300,
            width: double.infinity,
            child: Center(
              child: CustomText(
                text: 'NO Programs Uploaded',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: FrontEndConfigs.kPrimaryColor,
              ),
            ),
          );
        } else {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _myProgramsList.length,
              itemBuilder: (context, index) {
                return ProgramCard(
                    imagePath: _myProgramsList[index].programImage ??
                        'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
                    title: _myProgramsList[index].programTitle ?? '',
                    description:
                        _myProgramsList[index].programDescription ?? '',
                    date: _myProgramsList[index].programDate ?? '');
              });
        }
      },
    );
  }
}
