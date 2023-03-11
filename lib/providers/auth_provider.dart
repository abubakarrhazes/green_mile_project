import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  static final _auth = FirebaseAuth.instance;

  AuthProvider._();

  static User? getUser() {
    return _auth.currentUser;
  }

  static Future<String?> registerUser(
      String name, String email, String password) async {
    String? errorMessage;
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await _auth.currentUser!.updateDisplayName(name);
    }).onError<FirebaseAuthException>((error, stackTrace) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        case 'email-already-in-use':
          errorMessage = 'Email address has been taken, try a different one';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email and password authentication is not allowed';
          break;
        case 'weak-password':
          errorMessage = 'Week password';
          break;
        default:
          errorMessage = 'Unkown error, likely to be from network';
      }
      log('$errorMessage', error: error, name: AuthProvider._().toString());
    });
    return errorMessage;
  }

  static Future<String?> loginUser(String email, String password) async {
    String? errorMessage;
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) {})
        .onError<FirebaseAuthException>((error, stackTrace) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        case 'user-disabled':
          errorMessage = 'Account disabled';
          break;
        case 'user-not-found':
          errorMessage = 'Email address not recorgnized';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password';
          break;
        default:
          errorMessage = 'Service error';
      }
    });
    return errorMessage;
  }

  static Future<String?> loginWithGoogle() async {
    String? errorMessage;
    await _auth
        .signInWithProvider(GoogleAuthProvider())
        .then((UserCredential userCredential) => null)
        .onError<FirebaseAuthException>((error, stackTrace) {
      if (error.code == "user-disabled") {
        errorMessage = 'Account disabled';
      } else {
        errorMessage = 'Service error';
      }
    });
    return errorMessage;
  }

  static Future<String?> loginWithTwitter() async {
    String? errorMessage;
    await _auth
        .signInWithProvider(TwitterAuthProvider())
        .then((UserCredential userCredential) => null)
        .onError<FirebaseAuthException>((error, stackTrace) {
      if (error.code == "user-disabled") {
        errorMessage = 'Account disabled';
      } else {
        errorMessage = 'Service error';
      }
    });
    return errorMessage;
  }

  static Future<void> logout() {
    return _auth.signOut();
  }

  static Future<String?> sendResetPassword(String email) async {
    String? errorMessage;
    await _auth
        .sendPasswordResetEmail(email: email)
        .onError<FirebaseAuthException>((error, stackTrace) {
      switch (error.code) {
        case 'auth/invalid-email':
          errorMessage = 'Invalid email address';
          break;
        case 'auth/user-not-found':
          break;
        default:
          errorMessage = 'Service or internal error';
      }
    });
    return errorMessage;
  }
}
