import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';

class AuthRepository {
  AuthRepository({required this.authInstance});

  Logger _logger = Logger('AuthRepository');

  final FirebaseAuth authInstance;
  Future<bool> login(String email, String password) async {
    await authInstance.signInWithEmailAndPassword(
        email: email, password: password);

    return true;
  }

  Future<bool> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final firebaseUser = await authInstance.createUserWithEmailAndPassword(
          email: email, password: password);

      await firebaseUser.user!.updateDisplayName(name);

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await authInstance.signInWithCredential(credential);

      return true;
    } catch (e) {
      _logger.severe(e);
      return false;
    }
  }

  Future<bool> logout() async {
    await authInstance.signOut();
    return true;
  }
}
