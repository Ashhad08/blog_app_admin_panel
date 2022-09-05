import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class GroupListTile extends StatelessWidget {
  const GroupListTile({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/group1.png'),
                ),
              ),
            ),
            title: const FittedBox(
              child: CustomText(
                text: 'Northeast Group (32 Members)',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textColor: FrontEndConfigs.kReceivingChatBubbleColor,
              ),
            ),
            subtitle: const CustomText(
                text:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur.',
                fontSize: 10,
                maxLines: 2,
                textColor: Color(0xff707070),
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
              height: 0,
              thickness: 1,
              color: FrontEndConfigs.kBlackColor.withOpacity(0.1))
        ],
      ),
    );
  }
}
