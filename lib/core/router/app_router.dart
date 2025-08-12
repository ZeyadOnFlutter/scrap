import 'package:go_router/go_router.dart';
import '../../features/auth/view/login.dart';
import '../../features/auth/view/regsiter.dart';
import '../../features/auth/view/vehicle_details.dart';
import '../../features/splash/splash_screen.dart';
import 'route_names.dart';
import 'route_paths.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.register,
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
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: RoutePaths.register,
      name: RouteNames.register,
      builder: (context, state) => const Register(),
      routes: [
        GoRoute(
          path: RoutePaths.vehicleDetials,
          name: RouteNames.vehicleDetials,
          builder: (context, state) => const VehicleDetails(),
        ),
      ],
    ),
  ],
);
