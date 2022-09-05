import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import '../../manage_programs_view/layout/widgets/program_card.dart';
import 'widgets/event_card.dart';

class ManageEventsViewBody extends StatelessWidget {
  const ManageEventsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  const CustomText(
                    text: 'Upcoming Events',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    textColor: Color(0xff585858),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const EventCard();
                        }),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomText(
                    text: 'Past Events',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    textColor: Color(0xff585858),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
            const ProgramCard(),
          ],
        ),
      ),
    );
  }
}
