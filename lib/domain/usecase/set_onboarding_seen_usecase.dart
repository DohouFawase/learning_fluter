import '../../data/repository/onbrandrepository/onboarding_repository.dart';
import 'package:my_flutter_app/main.dart'; // Importation ajoutée ici

class SetOnboardingSeenUsecase {
  final OnboardingRepository repository;

  SetOnboardingSeenUsecase({required this.repository});

  Future<void> call(bool bool) async {
    await repository.setOnboardingSeen();

    // Le service est maintenant accessible ici
    onboardingService.updateOnboardingStatus(true);
  }
}
