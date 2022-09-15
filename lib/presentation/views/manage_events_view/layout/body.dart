import 'package:blog_app_admin_panel/backend/models/event_model.dart';
import 'package:blog_app_admin_panel/backend/services/system_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import '../../manage_programs_view/layout/widgets/program_card.dart';
import 'widgets/event_card.dart';

class ManageEventsViewBody extends StatelessWidget {
  const ManageEventsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  child: StreamProvider.value(
                    value: SystemServices().fetchMyUpcomingEvents(),
                    initialData: [EventModel(eventGalleryImages: [])],
                    builder: (context, child) {
                      List<EventModel> myUpcomingEventsList =
                          context.watch<List<EventModel>>();
                      if (myUpcomingEventsList.isEmpty) {
                        return const Center(
                          child: CustomText(
                            text: 'NO Upcoming Events',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textColor: FrontEndConfigs.kPrimaryColor,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: myUpcomingEventsList.length,
                            itemBuilder: (context, index) {
                              return EventCard(
                                  title:
                                      myUpcomingEventsList[index].eventTitle ??
                                          '',
                                  description: myUpcomingEventsList[index]
                                          .eventDescription ??
                                      '',
                                  date: DateFormat("MMM d, yyyy").format(
                                      formatDate(myUpcomingEventsList[index]
                                              .eventDate ??
                                          Timestamp.now())));
                            });
                      }
                    },
                  ),
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
          StreamProvider.value(
              value: SystemServices().fetchMyPastEvents(),
              initialData: [EventModel(eventGalleryImages: [])],
              builder: (context, child) {
                List<EventModel> myPastEventsList =
                    context.watch<List<EventModel>>();
                if (myPastEventsList.isEmpty) {
                  return const Center(
                    child: CustomText(
                      text: 'NO Past Events',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textColor: FrontEndConfigs.kPrimaryColor,
                    ),
                  );
                } else {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: myPastEventsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        try {
                          return ProgramCard(
                              imagePath:
                                  myPastEventsList[index].eventGalleryImages[0],
                              title: myPastEventsList[index].eventTitle ?? '',
                              description:
                                  myPastEventsList[index].eventDescription ??
                                      '',
                              date: DateFormat("EEEE, MMMM d, yyyy").format(
                                  formatDate(
                                      myPastEventsList[index].eventDate ??
                                          Timestamp.now())));
                        } catch (e) {
                          debugPrint(e.toString());
                          return const SizedBox();
                        }
                      });
                }
              })
        ],
      ),
    );
  }

  DateTime formatDate(Timestamp date) {
    return date.toDate();
  }
}
