// lib/ui/features/auth/login/views/login_screen.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/data/repository/autrepository/auth_repository_impl.dart';
import 'package:my_flutter_app/domain/usecase/login_usecase.dart.dart';
import 'package:my_flutter_app/ui/features/auth/login/loginviewmodel/login_model.dart';
import 'package:my_flutter_app/ui/features/auth/login/widgets/logincomponents.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/data/datasources/auth_local_datasource.dart';
import '../../../../../main.dart'; // Importez le main pour accéder à l'instance globale de authService

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Créez l'instance du localDatasource
    final authLocalDatasource = AuthLocalDatasource();

    // Création des dépendances ici
    final authRepository = AuthRepositoryImpl(
      authService: authService, // Utilise l'instance globale
      localDatasource: authLocalDatasource, // Fournit la dépendance requise
    );
    // Créez le usecase en passant le repository
    final loginUsecase = LoginUsecase(repository: authRepository);

    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Center(
        child: SingleChildScrollView(
          child: ChangeNotifierProvider<AuthViewModel>(
            create: (context) => AuthViewModel(loginUsecase: loginUsecase),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
