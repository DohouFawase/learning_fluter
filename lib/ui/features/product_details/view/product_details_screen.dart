// lib/ui/features/product_details/view/product_details_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/routing/routes.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Produit'),
        // Le bouton de retour est inclus par défaut par Flutter ici
        // si la page a été poussée sur la pile de navigation.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Détails du produit ID: $productId',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Vous pouvez aussi ajouter votre propre bouton si vous voulez
            // un comportement spécifique ou un style différent
            ElevatedButton(
              onPressed: () {
                context.go(Routes.home);
              },
              child: const Text('Retour'),
            ),
          ],
        ),
      ),
    );
  }
}
