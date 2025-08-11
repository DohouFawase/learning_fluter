import 'package:my_flutter_app/data/repository/homerepository/home_repository.dart';
import 'package:my_flutter_app/domain/entities/category.dart';
import 'package:my_flutter_app/domain/entities/product.dart';

class GetAllProductsUsecase {
  final HomeRepository repository;
  GetAllProductsUsecase({required this.repository});
  Future<List<Product>> call() async => await repository.getProducts();
}

class GetCategoriesUsecase {
  final HomeRepository repository;

  GetCategoriesUsecase({required this.repository});

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
