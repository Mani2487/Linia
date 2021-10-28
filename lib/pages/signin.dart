import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:linia/assets/@assets.dart';
import 'package:linia/pages/@pages.dart';

enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  // MobileVerificationState.SHOW_OTP_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;
  bool isLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        isLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.message.toString(),
      )));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        AppPrimaryTextField(
          maxLength: 10,
          label: 'Phone number',
          controller: phoneController,
        ),
        verticalSpacer(verticalSpace: 54),
        AppPrimaryButton(
          text: 'Send OTP',
          onTap: () async {
            setState(() {
              isLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: "+91" + phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  isLoading = false;
                });
                // signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(verificationFailed.message.toString())));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  isLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
        ),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        AppPrimaryTextField(
          label: 'Enter OTP',
          maxLength: 6,
          controller: otpController,
        ),
        verticalSpacer(verticalSpace: 54),
        AppPrimaryButton(
          text: 'Sign in',
          onTap: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);
            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF2F2F7),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    verticalSpacer(
                      verticalSpace: 157,
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
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: currentState ==
                              MobileVerificationState.SHOW_MOBILE_FORM_STATE
                          ? getMobileFormWidget(context)
                          : getOtpFormWidget(context),
                    ),
                  ],
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
