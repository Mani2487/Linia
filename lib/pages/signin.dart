import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:linia/assets/@assets.dart';
import 'package:linia/pages/@pages.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                    'Sign in',
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
                ),
                verticalSpacer(verticalSpace: 34),
                AppPrimaryButton(
                  text: 'Sign in',
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
                      'Don’t have an account, ',
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
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      splashColor: const Color(0x00FFFFFF),
                      child: const Text(
                        'Sign up',
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
