import 'package:app_coleta_seletiva/app/module/models/carrinho_model.dart';
import 'package:app_coleta_seletiva/app/module/models/error_model.dart';
import 'package:app_coleta_seletiva/app/module/models/predio_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/user/i_user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../models/user_model.dart';

class UserRepository implements IUserRepository {
  
  @override
  bool userIsLogged() {
    final auth = FirebaseAuth.instance;
    return auth.currentUser != null;
  }


  @override
  Future<void> editUser(UserModel newUser) async {
    try {
      final userId = await getUserId();
      final db = FirebaseFirestore.instance;
      await db.collection("usuarios").doc(userId).update(newUser.toMap());
    } catch (error) {
      throw const ErrorModel(message: 'Nao foi possivel editar o usuario');
    }
  }

  @override
  Future<String> getUserId() async {
    try {
      final auth = FirebaseAuth.instance;

      if (auth.currentUser == null) {
        throw ErrorDescription('CurrentUser Nao encontrado');
      }

      return auth.currentUser!.uid;
    } catch (error) {
      throw const ErrorModel(
        message:
            'Você não está logado, por favor faça o login antes de realizar esta ação!',
      );
    }
  }

  @override
  Future<String> getUserType() async {
    try {
      final db = FirebaseFirestore.instance;
      final userId = await getUserId();
      final query = await db.collection("usuarios").doc(userId).get();
      var map = query.data() as Map<String, dynamic>;

      if (map == null) {
        throw const ErrorModel(message: 'tipoUser nao encontrado');
      }
      String tipoUser = map["tipoUser"];

      return tipoUser;
    } catch (error) {
      debugPrint('ERROR (getUserType) = $error');
      throw const ErrorModel(message: 'tipoUser nao encontradoaaaa');
    }
  }


//REVISAR
  @override
  Future<void> solicitarColeta(CarrinhoModel carrinho) async {
    try {
      final db = FirebaseFirestore.instance;
      final userId = await getUserId();
      db.collection("solicitacoes")
          .doc(userId)
          .set(carrinho.toMap());


      } catch (error) {
      debugPrint('ERROR (solicitarColeta) => $error');
      throw const ErrorModel(message: 'Erro ao solicitar coleta.');
    }
  }


  
  @override
  Future<int> consultarPontuacao(UserModel user) async {
    try {
      final db = FirebaseFirestore.instance;
      final query = await db
      .collection("usuarios")
      .where("cpf", isEqualTo: user.cpf)
      .get();

      final map = query.docs.first.data();
      return map['pontuacao'];
    } catch (error){
      debugPrint('ERROR (consultarPontuacao) => $error');
      throw const ErrorModel(message: 'Erro na consulta de pontuação.');
    }
  }
  @override
  Future<void> atualizarPontuacao(int pontuacao, UserModel user) async {
    try{
      final db = FirebaseFirestore.instance;
      final query = await db
          .collection("usuarios")
          .where("cpf", isEqualTo: user.cpf)
          .get();

      Map map = query.docs.first.data();
      map["pontuacao"] = pontuacao;

      db.collection("usuarios")
      .doc(user.cpf.toString())
      .update(map["pontuacao"]);

    }catch (error){
      debugPrint('ERROR (consultarPontuacao) => $error');
      throw const ErrorModel(message: 'Erro na atualização de pontuação.');
    }
  }

  @override
  Future<void> solicitarVisita(CarrinhoModel carrinho) async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection("solicitacoes").get();


    } catch (error) {
      debugPrint('ERROR (createPredio) => $error');
      throw const ErrorModel(message: 'Erro ao solicitar visita do coletor.');
    }
  }

  @override
  Future<Map<String, dynamic>> verificarSolicitacoes () async{
    try {
      final db = FirebaseFirestore.instance;
      Map<String, dynamic> solicitacao = (await db.collection("solicitacoes").get()) as Map<String, dynamic>;

      return solicitacao;

    } catch (error) {
      debugPrint('ERROR (createPredio) => $error');
      throw const ErrorModel(message: 'Erro ao solicitar verificar solicitacoes.');
    }
  }

  @override
  Future<void> aceitarSolicitacao() async {
    try {
      final db = FirebaseFirestore.instance;
      Map<String, dynamic> solicitacao = (await db.collection("solicitacoes").get()) as Map<String, dynamic>;

      final userId = await getUserId();
      db.collection("solicitacoesAceitas")
          .doc(userId)
          .set(solicitacao);


    } catch (error) {
      debugPrint('ERROR (createPredio) => $error');
      throw const ErrorModel(message: 'Erro ao aceitar solicitacoes.');
    }
  }

  @override
  Future<Map<String, dynamic>> verificarSolicitacoesAceitas () async{
    try {
      final db = FirebaseFirestore.instance;
      Map<String, dynamic> solicitacao = (await db.collection("solicitacoes").get()) as Map<String, dynamic>;

      return solicitacao;

    } catch (error) {
      debugPrint('ERROR (createPredio) => $error');
      throw const ErrorModel(message: 'Erro ao solicitar verificar solicitacoes aceitas.');
    }
  }

  @override
  Future<void> salvarHistorico (CarrinhoModel carrinho) async {
    try {
      final db = FirebaseFirestore.instance;
      final userId = await getUserId();
      db.collection("historico")
          .doc(userId)
          .set(carrinho.toMap());


    } catch (error) {
      debugPrint('ERROR (solicitarColeta) => $error');
      throw const ErrorModel(message: 'Erro ao salvar historico de coleta.');
    }

  }

  @override
  Future<Map<String, dynamic>> verificarHistorico () async{
    try {
      final db = FirebaseFirestore.instance;
      Map<String, dynamic> historico = (await db.collection("historico").get()) as Map<String, dynamic>;

      return historico;

    } catch (error) {
      debugPrint('ERROR (createPredio) => $error');
      throw const ErrorModel(message: 'Erro ao solicitar verificar historico.');
    }
  }

}
