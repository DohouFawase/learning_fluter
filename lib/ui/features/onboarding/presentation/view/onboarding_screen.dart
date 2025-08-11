// lib/ui/features/onboarding/presentation/view/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/data/datasources/onboarding_local_datasource.dart';
import 'package:my_flutter_app/data/repository/onbrandrepository/onboarding_repository_impl.dart';
import 'package:my_flutter_app/domain/usecase/set_onboarding_seen_usecase.dart';
import 'package:my_flutter_app/ui/features/onboarding/presentation/provider/onboarding_viewmodel.dart';
import 'package:my_flutter_app/data/services/onboarding_service.dart';
// Importez vos services globaux
import '../../../../../main.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localDatasource = OnboardingLocalDatasource();
    // Utilisez l'instance globale, ne créez pas de nouvelle instance ici
    final repository = OnboardingRepositoryImpl(
      localDatasource: localDatasource,
      onboardingService: onboardingService, // Instance globale
    );
    final usecase = SetOnboardingSeenUsecase(repository: repository);

    return ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(
        setOnboardingSeenUsecase: usecase,
        onboardingService: onboardingService, // Instance globale
      ),
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, child) {
          return IntroductionScreen(
            pages: [
              PageViewModel(
                title: "Bienvenue !",
                body: "Découvrez notre application et ses fonctionnalités.",
                image: const Icon(
                  Icons.waving_hand,
                  size: 100,
                  color: Colors.blue,
                ),
                decoration: const PageDecoration(
                  titleTextStyle: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PageViewModel(
                title: "Naviguez facilement",
                body:
                    "Une navigation intuitive pour trouver ce que vous cherchez.",
                image: const Icon(
                  Icons.navigation,
                  size: 100,
                  color: Colors.green,
                ),
                decoration: const PageDecoration(
                  titleTextStyle: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PageViewModel(
                title: "Prêt à commencer ?",
                body: "Commencez dès maintenant en créant votre compte.",
                image: const Icon(Icons.check, size: 100, color: Colors.purple),
                decoration: const PageDecoration(
                  titleTextStyle: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            onDone: () async {
              await viewModel.completeOnboarding();
            },
            showSkipButton: true,
            skip: const Text("Passer"),
            next: const Icon(Icons.arrow_forward),
            done: const Text(
              "Terminer",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
