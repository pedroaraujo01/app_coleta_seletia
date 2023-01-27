import 'package:app_coleta_seletiva/app/module/models/user_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/user/i_user_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/carrinho_model.dart';
import '../models/predio_model.dart';
import '../models/error_model.dart';
import '../repository/predio/i_predio_repository.dart';

part 'morador_controller.g.dart';

class MoradorController = MoradorControllerBase with _$MoradorController;

abstract class MoradorControllerBase with Store {
  final IPredioRepository _predioRepository;
  final IUserRepository _userRepository;

  const MoradorControllerBase(
    this._predioRepository,
    this._userRepository
  );

  Future<void> solicitarColeta(CarrinhoModel carrinho) async {
    try {
      return await _userRepository.solicitarColeta(carrinho);
    } on ErrorModel catch (_) {
      rethrow;
    }
  }

   resgatarCupom(int pontuacao, UserModel user) async {
    try {
      return await _userRepository.resgatarCupom(pontuacao, user);
    } on ErrorModel catch (_) {
      rethrow;
    }
  }

  Future<PredioModel> buscarPredio(int cep, String name, String address) async {
    try {
      return await _predioRepository.get(cep, name, address);
    } on ErrorModel catch (_) {
      rethrow;
    }
  }
}
