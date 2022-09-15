import 'package:flutter/material.dart';

import 'custom_text.dart';

class SelectDateTile extends StatelessWidget {
  const SelectDateTile({
    Key? key,
    required this.onTap,
    required this.date,
  }) : super(key: key);
  final VoidCallback onTap;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: date,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: Color(0xff9D9D9D),
              ),
              Container(
                width: 200,
                height: 1,
                color: const Color(0xffE2E2E2),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.calendar_month,
            color: Color(0xff9D9D9D),
          ),
        ],
      ),
    );
  }
}
