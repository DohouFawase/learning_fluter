import 'package:my_flutter_app/data/services/onboarding_service.dart';

import './onboarding_repository.dart';
import '../../datasources/onboarding_local_datasource.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDatasource localDatasource;

  OnboardingRepositoryImpl({
    required this.localDatasource,
    required OnboardingService onboardingService,
  });

  @override
  Future<void> setOnboardingSeen() async {
    await localDatasource.setOnboardingSeen();
  }
}
