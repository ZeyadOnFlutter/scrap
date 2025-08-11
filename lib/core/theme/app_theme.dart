import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
