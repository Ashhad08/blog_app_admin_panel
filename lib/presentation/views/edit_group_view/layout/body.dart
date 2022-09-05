import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/members_tile.dart';
import 'widgets/remove_user_dialog.dart';

class EditGroupViewBody extends StatelessWidget {
  const EditGroupViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/group2.png'),
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
                      children: const [
                        CustomText(
                            text: 'Northeast Group',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        Spacer(),
                        Icon(
                          Icons.edit,
                          size: 20,
                          color: Color(0xffB4B2B2),
                        ),
                        CustomText(
                            text: 'Edit Title',
                            fontSize: 12,
                            textColor: FrontEndConfigs.kSubTextColor,
                            fontWeight: FontWeight.w400),
                        SizedBox(
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
                    const CustomText(
                        text:
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur.',
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
      ),
    );
  }
}
