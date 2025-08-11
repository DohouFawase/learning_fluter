import '../../domain/entities/product.dart';
import '../../domain/entities/category.dart';

class ProductLocalDatasource {
  Future<List<Product>> getProducts() async {
    // Simule une liste de produits
    return [
      Product(
        id: '1',
        name: 'Appartement en ville',
        categoryId: '1',
        imageUrl: 'https://placehold.co/600x400/png',
        title: 'Appartement en ville',
        price: 'Appartement en ville',
      ),
      Product(
        id: '2',
        name: 'Maison avec jardin',
        categoryId: '2',
        imageUrl: 'https://placehold.co/600x400/png',
        title: 'Appartement en ville',
        price: 'Appartement en ville',
      ),
      Product(
        id: '3',
        name: 'Villa de luxe',
        categoryId: '1',
        imageUrl: 'https://placehold.co/600x400/png',
        title: 'Appartement en ville',
        price: 'Appartement en ville',
      ),
    ];
  }

  Future<List<Category>> getCategories() async {
    // Simule une liste de catégories
    return [
      Category(id: '1', name: 'Appartements'),
      Category(id: '2', name: 'Maisons'),
      Category(id: '3', name: 'Terrains'),
      Category(id: '4', name: 'Bureaux'),
    ];
  }
}
