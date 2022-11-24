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

  const MoradorControllerBase(
    this._apartamentoRepository,
    this._predioRepository,
  );

  void solicitarColetaMorador() {}

  void resgatarCupom() {}

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
