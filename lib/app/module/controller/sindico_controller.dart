import 'package:app_coleta_seletiva/app/module/models/carrinho_model.dart';
import 'package:app_coleta_seletiva/app/module/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../repository/apartamento/i_apartamento_repository.dart';
import '../repository/predio/i_predio_repository.dart';
import '../repository/user/i_user_repository.dart';
import '../models/predio_model.dart';
import '../models/apartamento_model.dart';
import '../models/error_model.dart';

part 'sindico_controller.g.dart';

class SindicoController = SindicoControllerBase with _$SindicoController;

abstract class SindicoControllerBase with Store {
  final IApartamentoRepository _apartamentoRepository;
  final IPredioRepository _predioRepository;
  final IUserRepository _userRepository;

  const SindicoControllerBase(
    this._apartamentoRepository,
    this._predioRepository,
    this._userRepository,
  );

  @override
  Future<void> solicitarVisitaColetor(PredioModel predio, ApartamentoModel apartamento, CarrinhoModel carrinho) async {
    try {
      await _userRepository.solicitarVisitaColetor(predio, apartamento, carrinho);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  void liberarPontuacao(ApartamentoModel apartamento, UserModel user) {

  }

  @override
  Future<void> cadastrarPredio(PredioModel value, UserModel user) async {
    try {
      await _predioRepository.create(value, user);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  // Future<ApartamentoModel> buscarApartamento() async {
  //   try {
  //     final userId = await _userRepository.getUserId();
  //     return await _apartamentoRepository.get(userId);
  //   } on ErrorModel catch (error) {
  //     debugPrint(error.message);
  //     rethrow;
  //   }
  // }

  @override
  Future<void> liberarCadastroApartamento(ApartamentoModel value) async {
    try {
      await _apartamentoRepository.liberarCadastroApartamento(value);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
      rethrow;
    }
  }

 @override
  Future<void> removerCadastroApartamento(ApartamentoModel value) async {
    try {
      await _apartamentoRepository.delete(value);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
      rethrow;
    }
  }

  @override
  Future<void> removerPredio(PredioModel value) async {
    try {
      await _predioRepository.delete(value);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
      rethrow;
    }
  }
}
