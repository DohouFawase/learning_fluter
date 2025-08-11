// lib/features/home/presentation/views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_app/routing/routes.dart';
import 'package:my_flutter_app/ui/core/layouts/custom_app_bar.dart'
    show CustomAppBar;
import 'package:provider/provider.dart';
import 'package:my_flutter_app/data/datasources/product_local_datasource.dart';
import 'package:my_flutter_app/data/repository/homerepository/home_repository_impl.dart';
import 'package:my_flutter_app/domain/usecase/get_all_products_usecase.dart';
import 'package:my_flutter_app/ui/features/home/view_model/home_viewmodel.dart';
// Import your new CustomAppBar
import '../widgets/categories/category_list.dart';
import '../widgets/product/product_card.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialisation des dépendances
    final localDatasource = ProductLocalDatasource();
    final repository = HomeRepositoryImpl(localDatasource: localDatasource);
    final getProductsUsecase = GetAllProductsUsecase(repository: repository);
    final getCategoriesUsecase = GetCategoriesUsecase(repository: repository);

    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        getAllProductsUsecase: getProductsUsecase,
        getCategoriesUsecase: getCategoriesUsecase,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Accueil',
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Naviguer vers la page de profil
                context.go(Routes.profile);
              },
            ),
          ],
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            // ... (The rest of your body content)
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Catégories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CategoryList(categories: viewModel.categories),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Tous les produits',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: viewModel.products[index]);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
