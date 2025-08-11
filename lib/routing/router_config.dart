// lib/core/utils/router_config.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/main_screen.dart';
import 'package:my_flutter_app/ui/features/auth/login/views/login_screen.dart';
import 'package:my_flutter_app/ui/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:my_flutter_app/ui/features/product_details/view/product_details_screen.dart';
import 'routes.dart';

// import '../../main.dart';

// final router = GoRouter(
//   initialLocation: Routes.onboarding,
//   refreshListenable: Listenable.merge([onboardingService, authService]),
//   redirect: (context, state) {
//     final hasSeenOnboarding = onboardingService.hasSeenOnboarding;
//     final isLoggedIn = authService.isLoggedIn;
//     final isOnboardingPath = state.matchedLocation == Routes.onboarding;
//     final isLoginPath = state.matchedLocation == Routes.login;

//     // Règle 1 : L'onboarding n'a pas été vu, on y reste.
//     if (!hasSeenOnboarding) {
//       return isOnboardingPath ? null : Routes.onboarding;
//     }

//     // Règle 2 : L'utilisateur n'est pas connecté.
//     // L'onboarding a déjà été vu, donc on redirige vers le login.
//     if (!isLoggedIn) {
//       return isLoginPath ? null : Routes.login;
//     }

//     // Règle 3 : L'utilisateur est connecté et essaie d'accéder à l'onboarding ou au login.
//     // On le renvoie directement à la page d'accueil.
//     if (isLoggedIn && (isOnboardingPath || isLoginPath)) {
//       return Routes.home;
//     }

//     // Aucune redirection nécessaire.
//     return null;
//   },
//   routes: [
//     GoRoute(
//       path: Routes.onboarding,
//       builder: (context, state) => const OnboardingScreen(),
//     ),
//     GoRoute(
//       path: Routes.login,
//       builder: (context, state) => const LoginScreen(),
//     ),
//     GoRoute(
//       path: Routes.profile,
//       builder: (context, state) => const MainScreen(),
//     ),
//     GoRoute(path: Routes.home, builder: (context, state) => const MainScreen()),
//     GoRoute(
//       path: '${Routes.productDetails}/:id',
//       builder: (context, state) {
//         final productId = state.pathParameters['id']!;
//         return ProductDetailsScreen(productId: productId);
//       },
//     ),
//   ],
// );

import '../../main.dart';

final router = GoRouter(
  initialLocation: Routes.onboarding,
  refreshListenable: Listenable.merge([onboardingService, authService]),
  redirect: (context, state) {
    final hasSeenOnboarding = onboardingService.hasSeenOnboarding;
    final isLoggedIn = authService.isLoggedIn;
    final isOnboardingPath = state.matchedLocation == Routes.onboarding;
    final isLoginPath = state.matchedLocation == Routes.login;

    // Règle 1 : L'onboarding n'a pas été vu, on y reste.
    if (!hasSeenOnboarding) {
      return isOnboardingPath ? null : Routes.onboarding;
    }

    // Règle 2 (CORRIGÉE) : L'utilisateur n'est pas connecté.
    // L'onboarding a déjà été vu, donc on redirige vers le login.
    if (!isLoggedIn) {
      // Si l'utilisateur n'est pas connecté, on le redirige vers l'onboarding
      return (isOnboardingPath || isLoginPath) ? null : Routes.onboarding;
    }

    // Règle 3 : L'utilisateur est connecté et essaie d'accéder à l'onboarding ou au login.
    // On le renvoie directement à la page d'accueil.
    if (isLoggedIn && (isOnboardingPath || isLoginPath)) {
      return Routes.home;
    }

    // Aucune redirection nécessaire.
    return null;
  },
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => const MainScreen()),
    GoRoute(
      path: '${Routes.productDetails}/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return ProductDetailsScreen(productId: productId);
      },
    ),
  ],
);
