import 'package:blog_app_admin_panel/backend/models/group_model.dart';
import 'package:flutter/material.dart';

import '../elements/custom_text.dart';
import '../views/admin_dashboard/admin_dashboard.dart';
import '../views/auth/login_view/login_view.dart';
import '../views/auth/signup_view/signup_view.dart';
import '../views/auth/splash_view/splash_view.dart';
import '../views/create_event_view/create_event_view.dart';
import '../views/create_new_group_view/create_new_group_view.dart';
import '../views/create_program_view/create_program_view.dart';
import '../views/edit_group_view/edit_group_view.dart';
import '../views/manage_events_view/manage_events_view.dart';
import '../views/manage_groups_view/manage_groups_view.dart';
import '../views/manage_programs_view/manage_programs_view.dart';
import '../views/my_blogs_view/my_blogs_view.dart';
import '../views/write_blog_view/write_blog_view.dart';
import 'route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashViewRoute:
        return MaterialPageRoute(builder: (context) => SplashView());
      case RouteNames.loginViewRoute:
        return MaterialPageRoute(builder: (context) => LoginView());
      case RouteNames.signUpViewRoute:
        return MaterialPageRoute(builder: (context) => SignUpView());
      case RouteNames.dashboardViewRoute:
        return MaterialPageRoute(builder: (context) => AdminDashboardView());
      case RouteNames.writeBlogViewRoute:
        return MaterialPageRoute(builder: (context) => WriteBlogView());
      case RouteNames.myBlogsViewRoute:
        return MaterialPageRoute(builder: (context) => MyBlogsView());
      case RouteNames.manageEventsViewRoute:
        return MaterialPageRoute(builder: (context) => ManageEventsView());
      case RouteNames.createEventViewRoute:
        return MaterialPageRoute(builder: (context) => CreateEventView());
      case RouteNames.manageProgramsViewRoute:
        return MaterialPageRoute(builder: (context) => ManageProgramsView());
      case RouteNames.createProgramViewRoute:
        return MaterialPageRoute(builder: (context) => CreateProgramView());
      case RouteNames.manageGroupsViewRoute:
        return MaterialPageRoute(builder: (context) => ManageGroupsView());
      case RouteNames.createNewGroupViewRoute:
        return MaterialPageRoute(builder: (context) => CreateNewGroupView());
      case RouteNames.editGroupViewRoute:
        return MaterialPageRoute(
            builder: (context) =>
                EditGroupView(settings.arguments as GroupModel));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: CustomText(
                        text: "NO ROUTES DEFINED",
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ));
    }
  }
}
