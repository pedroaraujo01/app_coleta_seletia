import 'package:app_coleta_seletiva/app/module/models/user_model.dart';
import 'package:mobx/mobx.dart';

import '../repository/predio/i_predio_repository.dart';
import '../repository/user/i_user_repository.dart';
import '../models/apartamento_model.dart';

part 'sindico_controller.g.dart';

class SindicoController = SindicoControllerBase with _$SindicoController;

abstract class SindicoControllerBase with Store {
  final IPredioRepository _predioRepository;
  final IUserRepository _userRepository;

  const SindicoControllerBase(
    this._predioRepository,
    this._userRepository,
  );

  void liberarPontuacao(ApartamentoModel apartamento, UserModel user) {

  }

  void solicitarVisita(){

  }


}
