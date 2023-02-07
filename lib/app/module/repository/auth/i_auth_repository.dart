import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<UserCredential> signIn(String email, String password);
  Future<void> signOut();
}
