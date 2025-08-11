// abstract final class Routes {
//   static const home = '/';
//   static const login = '/login';
//   static const search = '/$searchRelative';
//   static const searchRelative = 'search';
//   static const results = '/$resultsRelative';
//   static const resultsRelative = 'results';
//   static const activities = '/$activitiesRelative';
//   static const activitiesRelative = 'activities';
//   static const booking = '/$bookingRelative';
//   static const bookingRelative = 'booking';
//   static String bookingWithId(int id) => '$booking/$id';
// }

// lib/core/utils/routes.dart
abstract final class Routes {
  static const onboarding = '/';
  static const home = '/home';
  static const login = '/login';
  static const productDetails = '/product-details';
  static const profile = '/profile';
  static const setting = '/setting';
  // Exemple pour une route avec un paramètre
  static String productDetailsWithId(String id) => '$productDetails/$id';
}
