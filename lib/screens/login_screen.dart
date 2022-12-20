import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_dance/controllers/auth/auth_controller.dart';
import 'package:i_dance/router/router_provider.dart';
import 'package:i_dance/router/utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(authControllerProvider.notifier)
                    .signInWithEmail(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) => ref
                        .read(appServiceProvider.notifier)
                        .loginState = true);
              },
              child: const Text('Log in'),
            ),

            OutlinedButton(
              onPressed: () async {
                // Navigate push to register screen
                context.push(AppPage.register.toPath);
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 16.0),
            // Row(
            //   children: const [
            //     Expanded(child: Divider()),
            //     Text('OR'),
            //     Expanded(child: Divider())
            //   ],
            // ),

            // // outlined button with google icon
            // OutlinedButton.icon(
            //   onPressed: () async {
            //     ref.read(authControllerProvider.notifier).loginWithGoogle();
            //     // .then((value) => ref
            //     //     .read(appServiceProvider.notifier)
            //     //     .loginState = true);
            //     // Perform Google login
            //     // try {
            //     //   await _googleSignIn.signIn();
            //     //   // Login successful
            //     // } catch (error) {
            //     //   // Login failed
            //     // }
            //   },
            //   icon: Image.asset(
            //     'assets/images/google.png',
            //     height: 24.0,
            //   ),
            //   label: const Text('Sign in with Google'),
            // ),
          ],
        ),
      ),
    );
  }
}
