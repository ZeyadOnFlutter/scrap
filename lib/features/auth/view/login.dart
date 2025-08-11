import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/utils/validator.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../widgets/auth_header.dart';
import '../widgets/signup_message.dart';
import '../widgets/social_login_options_buttons.dart';
import '../widgets/social_login_options_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _emailNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  late StreamSubscription<bool> keyboardSubscription;
  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailNode.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  ImageAssets.srapIcon,
                  height: 100.h,
                  width: 100.w,
                ),
                SizedBox(height: 10.h),
                const AuthHeader(
                  label1: 'Login to continue',
                  label2: 'Welcome Back',
                ),
                SizedBox(height: 44.h),
                CustomTextField(
                  controller: _emailController,
                  focusNode: _emailNode,
                  nextFocus: _passwordNode,
                  hintText: 'Email',
                  prefixIcon: SvgAssets.profile,
                  textInputType: TextInputType.emailAddress,
                  validator: Validator.validateEmail,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  focusNode: _passwordNode,
                  controller: _passwordController,
                  hintText: 'Password',
                  prefixIcon: SvgAssets.lock,
                  isObscured: true,
                  textInputType: TextInputType.text,
                  textInputFormatter: LengthLimitingTextInputFormatter(16),
                  validator: Validator.validatePassword,
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: getRegularStyle(color: ColorManager.blue)
                        .copyWith(fontSize: FontSize.s14),
                  ),
                ),
                SizedBox(height: 40.h),
                const SignupMessage(),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  label: 'Login',
                  onTap: _onLoginPressed,
                ),
                SizedBox(height: 20.h),
                const SocialLoginOptionsText(),
                SizedBox(height: 24.h),
                const SocialLoginOptionsButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {}
  }
}
