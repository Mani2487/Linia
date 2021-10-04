import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/@assets.dart';
import '../pages/@pages.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 41, top: 80, bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Welcome to ',
                        style: TextStyle(
                          fontFamily: 'SFPro',
                          fontSize: 28,
                          letterSpacing: 0.37,
                        ),
                      ),
                      Text(
                        'Línia',
                        style: TextStyle(
                          fontFamily: 'SFPro',
                          fontSize: 28,
                          letterSpacing: 0.37,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Get your first online book',
                    style: TextStyle(
                      fontFamily: 'SFPro',
                      fontSize: 14,
                      letterSpacing: 0.37,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppImages.onboardingBooksStacked),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                  child: AppPrimaryButton(
                    text: 'Get started',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
