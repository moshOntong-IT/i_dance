import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dance/router/router_provider.dart';

import '../router/service.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late AppService _service;

  @override
  void initState() {
    _service = ref.read(appServiceProvider.notifier);
    onStartUp();
    super.initState();
  }

  void onStartUp() async {
    await _service.onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Icon(
            Icons.favorite,
            size: 100,
            color: Colors.red,
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'iDance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
