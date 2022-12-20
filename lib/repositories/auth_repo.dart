import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  const AuthRepository({required this.authInstance});

  final FirebaseAuth authInstance;
  Future<void> login(String email, String password) async {
    await authInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final firebaseUser = await authInstance.createUserWithEmailAndPassword(
          email: email, password: password);

      await firebaseUser.user!.updateDisplayName(name);
    } catch (_) {}
  }

  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await authInstance.signInWithCredential(credential);
    } catch (_) {}
  }

  Future<void> logout() async {
    await authInstance.signOut();
  }
}
