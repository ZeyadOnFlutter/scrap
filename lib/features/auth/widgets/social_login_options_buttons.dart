import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/widgets/custom_outlined_button.dart';

class SocialLoginOptionsButtons extends StatelessWidget {
  const SocialLoginOptionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomOutlinedButton(
            label: 'FaceBook',
            onTap: () {},
            prefixIcon: _buildIconImage(SvgAssets.facebook),
          ),
        ),
        SizedBox(
          width: 20.h,
        ),
        Expanded(
          child: CustomOutlinedButton(
            label: 'Google',
            onTap: () {},
            prefixIcon: _buildIconImage(SvgAssets.google),
          ),
        ),
      ],
    );
  }

  Widget _buildIconImage(String? path) {
    return SvgPicture.asset(path ?? '');
  }
}
