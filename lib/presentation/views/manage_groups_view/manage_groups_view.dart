import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import '../../routes/route_names.dart';
import 'layout/body.dart';

class ManageGroupsView extends StatelessWidget {
  const ManageGroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      appBar: AppBar(
        title: const CustomText(
            text: 'Manage Groups', fontSize: 14, fontWeight: FontWeight.bold),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.createNewGroupViewRoute);
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: FrontEndConfigs.kWhiteColor,
        ),
      ),
      body: const ManageGroupsViewBody(),
    );
  }
}
