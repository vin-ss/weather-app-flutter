import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSource(this.firebaseAuth);

  Future<UserCredential> signUp(String email, String password) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Authentication error');
    } catch (e) {
      throw AuthException('Unexpected error');
    }
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Authentication error');
    } catch (e) {
      throw AuthException('Unexpected error');
    }
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}
