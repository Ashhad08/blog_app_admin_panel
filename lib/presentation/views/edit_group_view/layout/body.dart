import 'package:blog_app_admin_panel/backend/models/group_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/members_tile.dart';
import 'widgets/remove_user_dialog.dart';

class EditGroupViewBody extends StatelessWidget {
  final GroupModel _groupModel;

  const EditGroupViewBody(this._groupModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  _groupModel.groupImage ??
                      'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
                ),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_rounded,
                size: 30,
                color: Color(0xffCCCCCC),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 16,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                          text: _groupModel.groupTitle ?? '',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      const Spacer(),
                      const Icon(
                        Icons.edit,
                        size: 20,
                        color: Color(0xffB4B2B2),
                      ),
                      const CustomText(
                          text: 'Edit Title',
                          fontSize: 12,
                          textColor: FrontEndConfigs.kSubTextColor,
                          fontWeight: FontWeight.w400),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      CustomText(
                          text: 'Description',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.edit,
                        size: 20,
                        color: Color(0xffB4B2B2),
                      ),
                      CustomText(
                          text: 'Edit Description',
                          fontSize: 12,
                          textColor: FrontEndConfigs.kSubTextColor,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomText(
                      text: _groupModel.groupDescription ?? '',
                      fontSize: 12,
                      maxLines: 3,
                      textColor: FrontEndConfigs.kSubText2Color,
                      fontWeight: FontWeight.w400),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(
                    text: 'Members',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  MembersTile(
                    onRemove: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const RemoveUserDialog();
                          });
                    },
                  ),
                  MembersTile(
                    onRemove: () {},
                  ),
                  MembersTile(
                    onRemove: () {},
                  ),
                  MembersTile(
                    onRemove: () {},
                  ),
                  MembersTile(
                    onRemove: () {},
                  ),
                  MembersTile(
                    onRemove: () {},
                  ),
                  MembersTile(
                    onRemove: () {},
                  ),
                  MembersTile(
                    onRemove: () {},
                  ),
                  MembersTile(
                    onRemove: () {},
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
