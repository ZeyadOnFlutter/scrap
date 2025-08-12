import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/router/route_names.dart';
import '../../../core/utils/validator.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_toggle_message.dart';
import '../widgets/social_login_options_buttons.dart';
import '../widgets/social_login_options_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _nameNode = FocusNode();
  final _phoneController = TextEditingController();
  final _phoneNode = FocusNode();
  final _emailController = TextEditingController();
  final _emailNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordNode = FocusNode();
  final _confirmPasswordController = TextEditingController();
  final _confirmPasswordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  late StreamSubscription<bool> keyboardSubscription;
  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen(
      (bool visible) {
        if (!visible) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameNode.dispose();
    _phoneController.dispose();
    _phoneNode.dispose();
    _emailController.dispose();
    _emailNode.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordNode.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Register',
        automaticallyImplyLeading: true,
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
                SizedBox(height: 10.h),
                const AuthHeader(
                  label1: 'Sign Up Now',
                  label2: 'Welcome To Scrap',
                ),
                SizedBox(height: 30.h),
                CustomTextField(
                  controller: _nameController,
                  focusNode: _nameNode,
                  nextFocus: _phoneNode,
                  hintText: 'Full Name',
                  textCapitalization: TextCapitalization.words,
                  textInputFormatter: LengthLimitingTextInputFormatter(20),
                  prefixIcon: SvgAssets.profile,
                  textInputType: TextInputType.emailAddress,
                  validator: Validator.validateUsername,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _phoneController,
                  focusNode: _phoneNode,
                  nextFocus: _emailNode,
                  hintText: 'Phone Number',
                  prefixIcon: SvgAssets.phone,
                  textInputType: TextInputType.emailAddress,
                  validator: Validator.validateEgyptianPhoneNumber,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _emailController,
                  focusNode: _emailNode,
                  nextFocus: _passwordNode,
                  hintText: 'Email',
                  prefixIcon: SvgAssets.sms,
                  textInputType: TextInputType.emailAddress,
                  validator: Validator.validateEmail,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  focusNode: _passwordNode,
                  controller: _passwordController,
                  nextFocus: _confirmPasswordNode,
                  hintText: 'Password',
                  prefixIcon: SvgAssets.lock,
                  isObscured: true,
                  textInputType: TextInputType.text,
                  textInputFormatter: LengthLimitingTextInputFormatter(16),
                  validator: Validator.isValidPassword,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  focusNode: _confirmPasswordNode,
                  controller: _confirmPasswordController,
                  hintText: ' ConFirm Password',
                  prefixIcon: SvgAssets.lock,
                  isObscured: true,
                  textInputType: TextInputType.text,
                  textInputFormatter: LengthLimitingTextInputFormatter(16),
                  validator: (value) => Validator.validateConfirmPassword(
                    value,
                    _passwordController.text,
                  ),
                ),
                SizedBox(height: 30.h),
                AuthToggleMessage(
                  label1: 'Already have an account?',
                  label2: 'Login',
                  onTap: _onLoginPressed,
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  label: 'Register',
                  onTap: _onRegisterPressed,
                ),
                SizedBox(height: 20.h),
                const SocialLoginOptionsText(label: 'Or SignUp With'),
                SizedBox(height: 24.h),
                const SocialLoginOptionsButtons(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onRegisterPressed() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  void _onLoginPressed() {
    context.goNamed(RouteNames.login);
  }
}
