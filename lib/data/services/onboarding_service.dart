// lib/data/services/onboarding_service.dart
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService extends ChangeNotifier {
  static const _hasSeenOnboardingKey = 'has_seen_onboarding';
  bool _hasSeenOnboarding = false;

  bool get hasSeenOnboarding => _hasSeenOnboarding;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _hasSeenOnboarding = prefs.getBool(_hasSeenOnboardingKey) ?? false;
    notifyListeners();
  }

  Future<void> updateOnboardingStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenOnboardingKey, status);
    _hasSeenOnboarding = status;
    // C'est cette ligne qui informe le GoRouter du changement !
    notifyListeners();
  }
}
