import 'package:blog_app_admin_panel/backend/models/group_model.dart';
import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import 'layout/body.dart';

class EditGroupView extends StatelessWidget {
  final GroupModel _groupModel;

  const EditGroupView(this._groupModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: EditGroupViewBody(_groupModel),
    );
  }
}
