// lib/main.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/data/services/auth_service.dart';
import 'package:my_flutter_app/data/services/onboarding_service.dart';
import 'routing/router_config.dart';

// // Création des instances globales des services
// final onboardingService = OnboardingService();
// final authService = AuthService();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await onboardingService.initialize();
//   await authService.initialize();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: router,
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

final onboardingService = OnboardingService();
final authService = AuthService(onboardingService); // Passez le service ici

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await onboardingService.initialize();
  await authService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
