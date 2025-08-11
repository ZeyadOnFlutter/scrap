import 'package:go_router/go_router.dart';
import '../../features/auth/view/login.dart';
import '../../features/splash/splash_screen.dart';
import 'route_helpers.dart';
import 'route_names.dart';
import 'route_paths.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.splash,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      pageBuilder: (context, state) => platformPage(const Login()),
    ),
  ],
);
