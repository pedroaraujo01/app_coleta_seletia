import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/error_model.dart';
import '../repository/auth/auth_repository.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  //flutter packages pub run build_runner watch --delete-conflicting-outputs

  Future<void> logIn(String email, String password) async {
    try {
      final repository = AuthRepository();
      await repository.signIn(email, password);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  Future<void> logOut() async {
    try {
      final repository = AuthRepository();
      await repository.signOut();

      Modular.to.pushNamed(Modular.initialRoute);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }
}
