// lib/ui/features/home/view_model/home_viewmodel.dart
import 'package:flutter/foundation.dart'
    hide Category; // CORRECTED: Hiding the Flutter-provided Category class.
import 'package:my_flutter_app/domain/entities/product.dart';
import 'package:my_flutter_app/domain/entities/category.dart'; // This is your custom, correct Category class.
import 'package:my_flutter_app/domain/usecase/get_all_products_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetCategoriesUsecase getCategoriesUsecase;

  List<Product> _products = [];
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  HomeViewModel({
    required this.getAllProductsUsecase,
    required this.getCategoriesUsecase,
  }) {
    fetchData();
  }

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();
    _products = await getAllProductsUsecase.call();
    _categories = await getCategoriesUsecase.call();
    _isLoading = false;
    notifyListeners();
  }
}
