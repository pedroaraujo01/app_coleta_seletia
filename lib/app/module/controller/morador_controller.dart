import 'package:app_coleta_seletiva/app/module/models/requisicao_model.dart';
import 'package:app_coleta_seletiva/app/module/models/residuo_model.dart';
import 'package:app_coleta_seletiva/app/module/models/user_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/user/i_user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../models/apartamento_model.dart';
import '../models/predio_model.dart';
import '../models/error_model.dart';
import '../repository/predio/i_predio_repository.dart';
import '../repository/apartamento/i_apartamento_repository.dart';

part 'morador_controller.g.dart';

class MoradorController = MoradorControllerBase with _$MoradorController;

abstract class MoradorControllerBase with Store {
  final IApartamentoRepository _apartamentoRepository;
  final IPredioRepository _predioRepository;
  final IUserRepository _userRepository;

  const MoradorControllerBase(
    this._apartamentoRepository,
    this._predioRepository,
    this._userRepository
  );

  Future<void> solicitarColeta(RequisicaoModel requisicao) async {
    try {
      return await _userRepository.solicitarColeta(requisicao);
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

  Future<void> cadastrarApartamento(ApartamentoModel value) async {
    try {
      await _apartamentoRepository.create(value);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  Future<void> removerApartamento(ApartamentoModel value) async {
    try {
      await _apartamentoRepository.delete(value);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
      rethrow;
    }
  }
}
