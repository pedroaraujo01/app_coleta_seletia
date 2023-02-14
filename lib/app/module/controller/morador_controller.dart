
import 'package:app_coleta_seletiva/app/module/controller/carrinho_controller.dart';
import 'package:app_coleta_seletiva/app/module/models/carrinho_model.dart';
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

  Future<void> solicitarColeta(itemPapel, itemPlastico, itemMetal, itemVidro1, itemVidro2, itemVidro3, itemVidro4, itemVidro5, itemVidro6) async {
    try{
      CarrinhoController carrinho = CarrinhoController(_userRepository);
      var papel = await carrinho.papelModel(itemPapel);
      var plastico = await carrinho.plasticoModel(itemPlastico);
      var metal = await carrinho.metalModel(itemMetal);
      var vidro = await carrinho.vidroModel(itemVidro1, itemVidro2, itemVidro3, itemVidro4, itemVidro5, itemVidro6);
      carrinho.multiplicarVidro(vidro);
      var carrinhoMontado = await carrinho.montarCarrinho(papel, vidro, plastico, metal);
      final repository = UserRepository();
      repository.salvarHistorico(carrinhoMontado);


    } catch (error){
      debugPrint('ERROR (consultarPontuacao) => $error');
      throw const ErrorModel(message: 'Erro na solicitacao de coleta.');
    }
  }

  Future<Map<String, dynamic>> verificarHistorico(){
    try{
      final repository = UserRepository();
      var historico = repository.verificarHistorico();
      return historico;
    }catch (error) {
      debugPrint('ERROR (consultarPontuacao) => $error');
      throw const ErrorModel(message: 'Erro na verificacao do historico.');
    }
  }

  Future<Map<String, dynamic>> verificarSolicitacoes(){
    try{
      final repository = UserRepository();
      var historico = repository.verificarSolicitacoes();
      return historico;
    }catch (error) {
      debugPrint('ERROR (consultarPontuacao) => $error');
      throw const ErrorModel(message: 'Erro na verificacao de solicitacao.');
    }
  }

  Future<Map<String, dynamic>> verificarSolicitacoesAceitas(){
    try{
      final repository = UserRepository();
      var historico = repository.verificarSolicitacoesAceitas();
      return historico;
    }catch (error) {
      debugPrint('ERROR (consultarPontuacao) => $error');
      throw const ErrorModel(message: 'Erro na verificacao de solicitacao.');
    }
  }

  Future<void> SolicitarVisita(CarrinhoModel carrinho)async {
    try{
      final repository = UserRepository();
      var historico = repository.solicitarVisita(carrinho);

    }catch (error) {
      debugPrint('ERROR (consultarPontuacao) => $error');
      throw const ErrorModel(message: 'Erro na verificacao de solicitacao.');
    }
  }


}
