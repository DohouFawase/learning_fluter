// lib/ui/features/onboarding/presentation/provider/onboarding_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:my_flutter_app/domain/usecase/set_onboarding_seen_usecase.dart';
import 'package:my_flutter_app/data/services/onboarding_service.dart';

class OnboardingViewModel extends ChangeNotifier {
  final SetOnboardingSeenUsecase _setOnboardingSeenUsecase;
  final OnboardingService _onboardingService;

  OnboardingViewModel({
    required SetOnboardingSeenUsecase setOnboardingSeenUsecase,
    required OnboardingService onboardingService,
  }) : _setOnboardingSeenUsecase = setOnboardingSeenUsecase,
       _onboardingService = onboardingService;

  Future<void> completeOnboarding() async {
    await _setOnboardingSeenUsecase.call(true);
    // Il appelle le service, qui déclenchera la notification
    await _onboardingService.updateOnboardingStatus(true);
  }
}
