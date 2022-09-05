import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/blog_card.dart';

class MyBlogsViewBody extends StatelessWidget {
  const MyBlogsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xffEBEBEB),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 21,
                        ),
                        Icon(
                          Icons.search_rounded,
                          size: 30,
                          color: Color(0xffB4B2B2),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CustomText(
                          text: 'Search by name',
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          textColor: Color(0xffB4B2B2),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const BlogCard(),
            const BlogCard(),
          ],
        ),
      ),
    );
  }
}
