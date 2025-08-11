import 'package:flutter/material.dart';
import 'package:my_flutter_app/main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenue sur votre page de profil!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Appel de la méthode de déconnexion sur l'instance globale du service
                await authService.logout();

                // Le routeur va automatiquement rediriger grâce à la redirection dans router_config.dart
                // Pas besoin d'appeler context.go() ou context.push() ici
              },
              child: const Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }
}
