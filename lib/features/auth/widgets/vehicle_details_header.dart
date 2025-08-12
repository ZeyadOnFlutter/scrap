import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/widgets/custom_icon_button.dart';

class VehicleDetailsHeader extends StatelessWidget {
  const VehicleDetailsHeader({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            CustomIconButton(
              iconColor: ColorManager.white,
              size: 30.r,
              iconData: Icons.arrow_back,
              onPressed: onPressed,
            ),
            SizedBox(width: 20.w),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter Your Vehicle',
                style: getBoldStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
