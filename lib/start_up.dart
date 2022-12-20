import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartUp extends ConsumerStatefulWidget {
  const StartUp({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<StartUp> createState() => _StartUpState();
}

class _StartUpState extends ConsumerState<StartUp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
