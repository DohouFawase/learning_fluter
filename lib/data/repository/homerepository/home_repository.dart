import 'package:my_flutter_app/domain/entities/category.dart';
import 'package:my_flutter_app/domain/entities/product.dart';

abstract class HomeRepository {
  Future<List<Product>> getProducts();
  Future<List<Category>> getCategories();
}
