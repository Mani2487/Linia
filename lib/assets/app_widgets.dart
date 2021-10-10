import 'dart:ui';

import 'package:flutter/material.dart';

// Used in Onboarding, Signup, sign in
class AppPrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const AppPrimaryButton({Key? key, this.text = '', required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontFamily: 'SFPro',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.3,
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff5D5FEF)),
        minimumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 60)),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}

// Used in Signup, sign in
class AppPrimaryTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  TextEditingController? controller;

  AppPrimaryTextField({
    Key? key,
    this.label = '',
    this.isPassword = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(
          fontFamily: 'SFPro',
          fontSize: 17,
        ),
        fillColor: const Color(0xffFFFFFF),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFFFFFF), width: 0.0),
        ),
      ),
    );
  }
}
