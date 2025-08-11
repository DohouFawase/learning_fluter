// lib/ui/features/onboarding/presentation/provider/onboarding_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:my_flutter_app/data/services/onboarding_service.dart';
import 'package:my_flutter_app/domain/usecase/set_onboarding_seen_usecase.dart';
// Import du service depuis le bon chemin

class OnboardingViewModel extends ChangeNotifier {
  final SetOnboardingSeenUsecase _setOnboardingSeenUsecase;
  final OnboardingService _onboardingService; // Dépendance ajoutée

  OnboardingViewModel({
    required SetOnboardingSeenUsecase setOnboardingSeenUsecase,
    required OnboardingService onboardingService,
  }) : _setOnboardingSeenUsecase = setOnboardingSeenUsecase,
       _onboardingService = onboardingService;

  Future<void> completeOnboarding() async {
    await _setOnboardingSeenUsecase.call(true);
    _onboardingService.updateOnboardingStatus(true); // <-- Appel du service
  }
}
