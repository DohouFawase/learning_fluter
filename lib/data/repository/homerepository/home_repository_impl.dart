// lib/features/home/data/repositories/home_repository_impl.dart
import 'package:my_flutter_app/data/datasources/product_local_datasource.dart';
import 'package:my_flutter_app/data/repository/homerepository/home_repository.dart';
import 'package:my_flutter_app/domain/entities/category.dart';
import 'package:my_flutter_app/domain/entities/product.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ProductLocalDatasource localDatasource;

  HomeRepositoryImpl({required this.localDatasource});

  @override
  Future<List<Product>> getProducts() {
    return localDatasource.getProducts();
  }

  @override
  Future<List<Category>> getCategories() {
    return localDatasource.getCategories();
  }
}
