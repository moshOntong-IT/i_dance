import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dance/providers/firebase.dart';

import 'package:permission_handler/permission_handler.dart';

class AppService extends ChangeNotifier {
  AppService(this._ref) {
    _ref.read(authStateChangesProvider.stream);
  }

  final Ref _ref;

  bool _initialized = false;
  bool _loginState = false;
  bool _isVerified = false;

  bool get initialized => _initialized;
  bool get loginState => _loginState;
  bool get isVerified => _isVerified;

  set loginState(bool state) {
    // sharedPreferences.setBool(LOGIN_KEY, state);
    _loginState = state;
    // _loginStateChange.add(state);
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set verified(bool value) {
    _isVerified = value;
  }

  set notifyVerified(bool value) {
    _isVerified = value;
    notifyListeners();
  }

  void _loginStateHandler(User? event) async {
    if (event != null) {
      loginState = true;

      return;
    }
    loginState = false;
  }

  Future<void> onAppStart() async {
    // final box = await _ref.read(utilHiveProvider.future);

    // This is just to demonstrate the splash screen is working.
    // In real-life applications, it is not recommended to interrupt the user experience by doing such things.
    await Future.delayed(const Duration(seconds: 2));
    final auth = _ref.read(firebaseAuthProvider);

    if (auth.currentUser == null) {
      _loginState = false;
    }
    // if (await auth.getSession(sessionId: 'current')) {
    //   _loginState = false;
    // }

    _initialized = true;
    notifyListeners();
  }

  // * This getPermission is not used in this project.
  static Future<void> getPermission() async {
    final storagePermissionStatus = await Permission.storage.status;
    if (storagePermissionStatus.isDenied ||
        storagePermissionStatus.isPermanentlyDenied) {
      if (await Permission.storage.request().isGranted) {
        return;
      }
      throw const StoragePermissionDenied('Storage permission denied');
    }
  }
}

/// {@template quest_game_delete_error_exception}
/// Error thrown when Storage permission is denied.
/// {@endtemplate}
class StoragePermissionDenied implements Exception {
  /// {@macro quest_game_delete_error_exception}
  const StoragePermissionDenied(this.message);

  ///Message for this Exception
  final String message;
}
