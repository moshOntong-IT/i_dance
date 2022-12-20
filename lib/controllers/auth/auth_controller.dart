import 'package:i_dance/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}
  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    final authRepository = ref.read(authRepoProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => authRepository.login(email, password));
  }

  Future<void> registerWithEmail(
      {required String name,
      required String email,
      required String password}) async {
    final authRepository = ref.read(authRepoProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => authRepository.register(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<void> loginWithGoogle() async {
    final authRepository = ref.read(authRepoProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => authRepository.loginWithGoogle());
  }
}
