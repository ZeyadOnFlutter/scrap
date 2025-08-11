import 'package:flutter/material.dart';
import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Scrap());
}

class Scrap extends StatelessWidget {
  const Scrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Scrap',
      routerConfig: router,
    );
  }
}
