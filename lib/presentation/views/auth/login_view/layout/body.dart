import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../backend/services/auth.dart';
import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';
import '../../../../routes/route_names.dart';
import '../../../../elements/auth_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _key = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthServices authServices = AuthServices();
    return LoadingOverlay(
      isLoading: isLoading,
      child: SafeArea(
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
                child: Form(
                  key: _key,
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
                      AuthTextField(
                        hintText: 'Email address',
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_outlined,
                        textEditingController: _emailController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Enter Email!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextField(
                        hintText: 'Password',
                        prefixIcon: Icons.lock_outline,
                        textInputType: TextInputType.text,
                        isPasswordField: true,
                        textEditingController: _passwordController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Enter Password!';
                          } else if (val.length < 7) {
                            return 'Password must above 6 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                          buttonText: 'LOGIN',
                          height: 46,
                          width: double.infinity,
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              makeLoadingTrue();
                              authServices
                                  .signInAdmin(
                                      email: _emailController.text,
                                      password: _passwordController.text)
                                  .then((value) {
                                makeLoadingFalse();
                                Navigator.pushNamed(
                                    context, RouteNames.dashboardViewRoute);
                              }).onError((error, stackTrace) {
                                makeLoadingFalse();
                                if (error
                                    .toString()
                                    .contains('invalid-email')) {
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message: 'Your email is invalid',
                                      color: Colors.red);
                                } else if (error
                                    .toString()
                                    .contains('wrong-password')) {
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message: 'Your password is wrong.',
                                      color: Colors.red);
                                } else if (error
                                    .toString()
                                    .contains('user-not-found')) {
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message:
                                          'User with this email doesn\'t exist.',
                                      color: Colors.red);
                                } else if (error
                                    .toString()
                                    .contains('user-disabled')) {
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message:
                                          'User with this email has been disabled.',
                                      color: Colors.red);
                                } else if (error
                                    .toString()
                                    .contains('too_many_requests')) {
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message:
                                          'Too many requests. Try again later.',
                                      color: Colors.red);
                                } else if (error
                                    .toString()
                                    .contains('operation_not_allowed')) {
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message:
                                          'Signing in with Email and Password is not enabled.',
                                      color: Colors.red);
                                } else if (error
                                    .toString()
                                    .contains('network-request-failed')) {
                                  FrontEndConfigs.showSnackBar(
                                      context: context,
                                      message: 'Check your internet connection',
                                      color: Colors.red);
                                } else {
                                  debugPrint(error.toString());
                                }
                              });
                            }
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
        ),
      ),
    );
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
