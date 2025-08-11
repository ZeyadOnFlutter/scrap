import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';

class SignupMessage extends StatelessWidget {
  const SignupMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          text: 'Don’t have an account? ',
          style: getRegularStyle(
            color: ColorManager.grey,
            fontSize: FontSize.s12,
          ),
          children: [
            TextSpan(
              text: 'Register',
              style: getMediumStyle(
                color: ColorManager.blue,
                fontSize: FontSize.s12,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log('Register tapped');
                },
            ),
          ],
        ),
      ),
    );
  }
}
