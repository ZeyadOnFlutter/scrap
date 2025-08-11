import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../resources/assets_manager.dart';
import 'route_names.dart';
import 'route_paths.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) {
        return AnimatedSplashScreen.withScreenFunction(
          splash: ImageAssets.splashLogo,
          duration: 2000,
          centered: true,
          splashIconSize: 300,
          animationDuration: const Duration(milliseconds: 1000),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.scale,
          screenFunction: () async {
            return const Scaffold(
              body: Text('Hello'),
            );
          },
        );
      },
    ),
  ],
);
