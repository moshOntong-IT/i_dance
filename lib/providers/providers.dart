import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dance/providers/firebase.dart';
import 'package:i_dance/repositories/auth_repo.dart';

final authRepoProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(authInstance: ref.watch(firebaseAuthProvider));
});
