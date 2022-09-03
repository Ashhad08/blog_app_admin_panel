import 'package:flutter/material.dart';

import 'widgets/options_card.dart';

class AdminDashboardViewBody extends StatelessWidget {
  const AdminDashboardViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 33,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 41,
                ),
                OptionsCard(
                  text: 'Write\nBlog',
                  onPressed: () {},
                  iconPath: 'assets/icons/write_blog.png',
                ),
                const SizedBox(
                  width: 23,
                ),
                OptionsCard(
                  text: 'My\nBlogs ',
                  onPressed: () {},
                  iconPath: 'assets/icons/my_blogs.png',
                ),
                const SizedBox(
                  width: 41,
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 41,
                ),
                OptionsCard(
                  text: 'Manage\nPrograms',
                  onPressed: () {},
                  iconPath: 'assets/icons/manage_programs.png',
                ),
                const SizedBox(
                  width: 23,
                ),
                OptionsCard(
                  text: 'Manage\nSpotlight ',
                  onPressed: () {},
                  iconPath: 'assets/icons/manage_spotlight.png',
                ),
                const SizedBox(
                  width: 41,
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 41,
                ),
                OptionsCard(
                  text: 'Manage\nEvents',
                  onPressed: () {},
                  iconPath: 'assets/icons/manage_events.png',
                ),
                const SizedBox(
                  width: 23,
                ),
                OptionsCard(
                  text: 'Account\nSettings',
                  onPressed: () {},
                  iconPath: 'assets/icons/account_settings.png',
                ),
                const SizedBox(
                  width: 41,
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 41,
                ),
                OptionsCard(
                  text: 'Manage\nGroups',
                  onPressed: () {},
                  iconPath: 'assets/icons/manage_groupes.png',
                ),
                const SizedBox(
                  width: 23,
                ),
                const Expanded(child: SizedBox()),
                const SizedBox(
                  width: 41,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
