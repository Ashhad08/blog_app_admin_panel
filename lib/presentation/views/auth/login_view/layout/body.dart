import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';
import '../../../../routes/route_names.dart';
import '../../../../elements/auth_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Scaffold(
          backgroundColor: FrontEndConfigs.kWhiteColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/key.png',
                        height: 23,
                        width: 23,
                      ),
                      const CustomText(
                          text: 'Admin Panel',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  const AuthTextField(
                      hintText: 'Email address',
                      prefixIcon: Icons.email_outlined),
                  const SizedBox(
                    height: 20,
                  ),
                  const AuthTextField(
                      hintText: 'Password', prefixIcon: Icons.lock_outline),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      buttonText: 'LOGIN',
                      height: 46,
                      width: double.infinity,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteNames.dashboardViewRoute);
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Don’t have an account? ",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        textColor: Color(0xff6E6E6E),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.signUpViewRoute);
                        },
                        child: const CustomText(
                          text: "Sign up",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          textColor: FrontEndConfigs.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
