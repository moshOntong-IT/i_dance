import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_dance/router/service.dart';
import 'package:i_dance/router/utils.dart';

class AppRouter {
  AppRouter(this.appService, this.ref);

  final AppService appService;
  final Ref ref;

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: appService,
    initialLocation: AppPage.home.toPath,
    routes: routes,
    redirect: (context, state) {
      final loginLocation = state.namedLocation(AppPage.login.toName);
      final homeLocation = state.namedLocation(AppPage.home.toName);
      final splashLocation = state.namedLocation(AppPage.splash.toName);
      final registerLocation = state.namedLocation(AppPage.register.toName);

      final isLogedIn = appService.loginState;
      final isInitialized = appService.initialized;

      final isGoingToLogin = state.subloc == loginLocation;
      final isGoingToInit = state.subloc == splashLocation;
      final isGointToRegister = state.subloc == registerLocation;

      if (!isInitialized && !isGoingToInit) {
        return splashLocation;
        // If not onboard and not going to onboard redirect to OnBoarding
      } else if (isInitialized &&
          !isLogedIn &&
          !isGoingToLogin &&
          !isGointToRegister) {
        return loginLocation;
      } else if (isInitialized &&
          !isLogedIn &&
          !isGoingToLogin &&
          isGointToRegister) {
        return registerLocation;
        // If all the scenarios are cleared but still going to any of that screen redirect to Home
        // Returning the homeLocation.
      } else if (isInitialized &&
          isLogedIn &&
          (isGointToRegister || isGoingToLogin || isGoingToInit)) {
        return homeLocation;
      } else {
        return null;
      }
    },
  );
}
