import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  final String? title;

  const CustomAppBar({this.automaticallyImplyLeading, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      surfaceTintColor: ColorManager.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      elevation: 5,
      titleSpacing: 24.w,
      shadowColor: Colors.black,
      title: Text(
        title ?? '',
        style: getMediumStyle(color: ColorManager.black)
            .copyWith(fontSize: FontSize.s24),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 65.h);
}
