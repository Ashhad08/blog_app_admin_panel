import 'package:flutter/material.dart';

import '../../../../elements/custom_text.dart';

class MembersTile extends StatelessWidget {
  const MembersTile({
    Key? key,
    required this.onRemove,
  }) : super(key: key);
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          height: 38,
          width: 38,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/user.png'),
            ),
          ),
        ),
        title: const CustomText(
            text: 'Username', fontSize: 14, fontWeight: FontWeight.w400),
        trailing: IconButton(
          onPressed: onRemove,
          splashRadius: 25,
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        ));
  }
}
