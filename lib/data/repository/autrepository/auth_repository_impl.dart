import 'package:my_flutter_app/data/services/auth_service.dart';

import './auth_repository.dart';
import '../../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource localDatasource;
  AuthRepositoryImpl({
    required this.localDatasource,
    required AuthService authService,
  });

  @override
  Future<void> login() async {
    // Logique de connexion API irait ici
    // Pour cet exemple, on met simplement à jour l'état local
    await localDatasource.setLoginStatus(true);
  }
}
