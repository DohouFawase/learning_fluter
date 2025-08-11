// lib/ui/features/auth/login/loginviewmodel/login_model.dart
import 'package:flutter/foundation.dart';
import 'package:my_flutter_app/domain/usecase/login_usecase.dart.dart'
    show LoginUsecase;

class AuthViewModel extends ChangeNotifier {
  final LoginUsecase loginUsecase;

  // Champs de l'état local
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _emailError;
  String? _passwordError;
  bool _isPasswordVisible =
      false; // Nouvel état pour la visibilité du mot de passe

  AuthViewModel({required this.loginUsecase});

  // Getters pour accéder à l'état depuis l'interface
  bool get isLoading => _isLoading;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  bool get isPasswordVisible => _isPasswordVisible; // Nouveau getter

  // Méthodes pour mettre à jour les champs
  void setEmail(String email) {
    _email = email;
    if (_emailError != null) {
      _emailError = null;
      notifyListeners();
    }
  }

  void setPassword(String password) {
    _password = password;
    if (_passwordError != null) {
      _passwordError = null;
      notifyListeners();
    }
  }

  // Nouvelle méthode pour basculer la visibilité du mot de passe
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  // Méthode de connexion
  Future<void> login() async {
    // Validation simple
    if (_email.isEmpty) {
      _emailError = 'L\'email est requis';
      notifyListeners();
      return;
    }
    if (_password.isEmpty) {
      _passwordError = 'Le mot de passe est requis';
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Appeler le cas d'utilisation pour la connexion
      await loginUsecase.call(_email, _password);

      // Une fois la connexion réussie, l'AuthService global sera mis à jour
      // et le GoRouter se chargera de la redirection.
    } catch (e) {
      // Gérer l'erreur de connexion, par exemple afficher un message d'erreur
      _passwordError = 'Identifiants incorrects'; // ou e.toString()
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
