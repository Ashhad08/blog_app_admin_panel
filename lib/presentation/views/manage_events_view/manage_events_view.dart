import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import '../../routes/route_names.dart';
import 'layout/body.dart';

class ManageEventsView extends StatelessWidget {
  const ManageEventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            text: 'Manage Events', fontSize: 14, fontWeight: FontWeight.bold),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.createEventViewRoute);
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: FrontEndConfigs.kWhiteColor,
        ),
      ),
      body: const ManageEventsViewBody(),
    );
  }
}
