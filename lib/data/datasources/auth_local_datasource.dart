import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  static const _isLoggedInKey = 'is_logged_in';
  Future<void> setLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, status);
  }
}
