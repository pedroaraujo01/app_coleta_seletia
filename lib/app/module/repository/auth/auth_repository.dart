import '../../repository/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<UserCredential> signIn(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      return await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint('ERROR (signIn)= $e');
      throw ErrorDescription('Não foi possivel fazer o signIn');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.signOut();
    } catch (error) {
      debugPrint('ERROR (signIn)= $error');
      throw ErrorDescription('Não foi possivel fazer o signOut');
    }
  }
}
