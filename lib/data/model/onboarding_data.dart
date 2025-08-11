// onboarding_data.dart
class OnboardingData {
  // final String imagePath;
  final String title;
  final String description;

  OnboardingData({
    // required this.imagePath,
    required this.title,
    required this.description,
  });
}

// Les données de toutes vos pages
final List<OnboardingData> onboardingPages = [
  OnboardingData(
    // imagePath: 'assets/images/onboarding1.png',
    title: 'Bienvenue dans notre application',
    description: 'Découvrez une nouvelle manière de faire les choses...',
  ),
  OnboardingData(
    // imagePath: 'assets/images/onboarding2.png',
    title: 'Toujours à vos côtés',
    description: 'Une assistance 24/7 pour vous aider à tout moment.',
  ),
  OnboardingData(
    // imagePath: 'assets/images/onboarding3.png',
    title: 'Commencez dès maintenant',
    description: 'Créer un compte et lancez-vous dans l\'aventure !',
  ),
];
