import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dance/router/router.dart';
import 'package:i_dance/router/service.dart';

final appServiceProvider = ChangeNotifierProvider<AppService>((ref) {
  return AppService(ref);
});

final goRouterProvider = Provider<AppRouter>((ref) {
  final appService = ref.watch(appServiceProvider);
  return AppRouter(appService, ref);
});
