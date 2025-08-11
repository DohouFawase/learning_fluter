// lib/core/services/auth_service.dart
import 'package:flutter/foundation.dart';
import 'package:my_flutter_app/data/services/onboarding_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static const _isLoggedInKey = 'is_logged_in';
  bool _isLoggedIn = false;

  // Dépendance sur OnboardingService
  final OnboardingService _onboardingService;

  // Constructeur qui prend OnboardingService
  AuthService(this._onboardingService);

  bool get isLoggedIn => _isLoggedIn;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    // ...
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, false);
    _isLoggedIn = false;

    // Réinitialiser le statut de l'onboarding ici
    await _onboardingService.updateOnboardingStatus(false);

    notifyListeners();
  }
}
