import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:linia/assets/@assets.dart';
import 'package:linia/pages/dashboard.dart';

import './@pages.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final uNameController = TextEditingController();

  @override
  void dispose() {
    uNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                verticalSpacer(
                  verticalSpace: 57,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'SFPro',
                      letterSpacing: 1.3,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const AppPrimaryTextField(
                  label: 'Username',
                ),
                verticalSpacer(verticalSpace: 34),
                const AppPrimaryTextField(
                  label: 'Password',
                  isPassword: true,
                  controller: uNameController,
                ),
                verticalSpacer(verticalSpace: 34),
                AppPrimaryButton(
                  text: 'Sign up',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                  },
                ),
                verticalSpacer(verticalSpace: 34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account, ',
                      style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                        );
                      },
                      splashColor: const Color(0x00FFFFFF),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontFamily: 'SFPro',
                          fontSize: 16,
                          color: Color(0xff5D5FEF),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container verticalSpacer({double verticalSpace = 0, Widget? child}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalSpace),
      child: child,
    );
  }
}
