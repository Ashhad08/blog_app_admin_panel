import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/auth_text_field.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';
import '../../../../routes/route_names.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const CustomText(
                  text: 'Let’s Get Started!',
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 60,
              ),
              const AuthTextField(
                hintText: 'Full Name',
                prefixIcon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              const AuthTextField(
                hintText: 'Email Address',
                prefixIcon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              const AuthTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              const AuthTextField(
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              const AuthTextField(
                hintText: 'Phone Number',
                prefixIcon: Icons.call,
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButton(
                  buttonText: 'Sign up',
                  height: 46,
                  width: double.infinity,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.dashboardViewRoute);
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Already have an account? ",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    textColor: Color(0xff6E6E6E),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.loginViewRoute);
                    },
                    child: const CustomText(
                      text: "Sign in",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      textColor: FrontEndConfigs.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
