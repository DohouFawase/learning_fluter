import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalDatasource {
  static const _hasSeenOnboardingKey = 'has_seen_onboarding';

  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenOnboardingKey, true);
  }
}
