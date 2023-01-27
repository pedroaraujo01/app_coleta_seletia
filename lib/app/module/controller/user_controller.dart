import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/auth_repository.dart';
import '../repository/user/user_repository.dart';
import '../../shared/app_routes.dart';
import '../models/error_model.dart';
import '../models/user_model.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  //flutter packages pub run build_runner watch --delete-conflicting-outputs

  Future<void> editUser(UserModel user) async {
    try {
      final repository = UserRepository();
      repository.editUser(user);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  void checkUserIsLogged() {
    final userRepository = UserRepository();
    final authRepository = AuthRepository();

    final isLogged = userRepository.userIsLogged();
    if (!isLogged) {
      authRepository.signOut();
      debugPrint(
        "Você não está logado, por favor faça o login antes de realizar esta ação!",
      );
      Modular.to.pushNamed(Modular.initialRoute);
    }
  }

  Future<void> getUserTypeById() async {
    try {
      final repository = UserRepository();
      final type = await repository.getUserType();
      openPageByUserType(type);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  void openPageByUserType(String type) {
    switch (type) {
      case "":
        Modular.to.pushNamed(Modular.initialRoute);
        break;
      case "morador":
        Modular.to.pushNamed(Routes.painelMorador);
        break;
      case "sindico":
        Modular.to.pushNamed(Routes.painelSindico);
        break;
    }
  }
}