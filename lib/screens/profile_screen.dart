import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dance/controllers/auth/auth_controller.dart';
import 'package:i_dance/router/router_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: const Text('Logout'),
        onPressed: () {
          ref.read(authControllerProvider.notifier).signOut().then((value) {
            ref.read(appServiceProvider.notifier).loginState = false;
          });
        },
      )),
    );
  }
}
