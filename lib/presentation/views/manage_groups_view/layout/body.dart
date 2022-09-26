import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/group_model.dart';
import '../../../../backend/services/system_services.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import '../../../routes/route_names.dart';
import 'widgets/group_list_tile.dart';

class ManageGroupsViewBody extends StatelessWidget {
  const ManageGroupsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: [GroupModel(groupMembers: [])],
      value: SystemServices().fetchMyGroups(),
      builder: (context, child) {
        List<GroupModel> _myGroupsList = context.watch<List<GroupModel>>();
        if (_myGroupsList.isEmpty) {
          return const SizedBox(
            height: 300,
            width: double.infinity,
            child: Center(
              child: CustomText(
                text: 'NO Groups Created',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: FrontEndConfigs.kPrimaryColor,
              ),
            ),
          );
        } else {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _myGroupsList.length,
              itemBuilder: (context, index) {
                try {
                  return GroupListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteNames.editGroupViewRoute,
                            arguments: _myGroupsList[index]);
                      },
                      imagePath: _myGroupsList[index].groupImage ??
                          'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
                      title: _myGroupsList[index].groupTitle ?? '',
                      description: _myGroupsList[index].groupDescription ?? '',
                      totalMembers: _myGroupsList[index].groupMembers.isEmpty
                          ? '0 Members'
                          : '(${_myGroupsList[index].groupMembers.length.toString()} Members)');
                } catch (e) {
                  debugPrint(e.toString());
                  return const SizedBox();
                }
              });
        }
      },
    );
  }
}
