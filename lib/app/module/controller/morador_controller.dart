
import 'package:app_coleta_seletiva/app/module/models/user_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/user/i_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/error_model.dart';
import '../repository/predio/i_predio_repository.dart';
import '../repository/user/user_repository.dart';

part 'morador_controller.g.dart';

class MoradorController = MoradorControllerBase with _$MoradorController;

abstract class MoradorControllerBase with Store {
  final IPredioRepository _predioRepository;
  final IUserRepository _userRepository;

  const MoradorControllerBase(
    this._predioRepository,
    this._userRepository
  );


  Future<bool> resgatarCupom(int pontuacao, UserModel user) async {
    try {
      final repository = UserRepository();
      final pontAtual = await repository.consultarPontuacao(user);
      bool resgatado;
      if(pontAtual > pontuacao){
        int pontuacaoAtual = pontAtual - pontuacao;
        repository.atualizarPontuacao(pontuacaoAtual, user);
        resgatado = true;

      }else{
        resgatado = false;
      }
      return resgatado;

    } catch (error){
      debugPrint('ERROR (consultarPontuacao) => $error');
      throw const ErrorModel(message: 'Erro na consulta de ponuação.');
    }
  }

  Future<void> solicitarColeta(UserModel user, ) async {
    try{
      final repository = UserRepository();


    } catch (error){

    }
  }


}
