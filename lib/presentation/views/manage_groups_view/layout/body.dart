import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../routes/route_names.dart';
import 'widgets/group_list_tile.dart';

class ManageGroupsViewBody extends StatelessWidget {
  const ManageGroupsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      body: Column(
        children: [
          GroupListTile(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.editGroupViewRoute);
            },
          ),
          GroupListTile(
            onTap: () {},
          ),
          GroupListTile(
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
