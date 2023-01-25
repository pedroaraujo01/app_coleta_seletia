import 'package:app_coleta_seletiva/app/module/models/apartamento_model.dart';
import 'package:app_coleta_seletiva/app/module/models/carrinho_model.dart';
import 'package:app_coleta_seletiva/app/module/models/error_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/user/i_user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/predio_model.dart';
import '../../models/requisicao_model.dart';
import '../../models/user_model.dart';

class UserRepository implements IUserRepository {
  @override
  bool userIsLogged() {
    final auth = FirebaseAuth.instance;
    return auth.currentUser != null;
  }

  @override
  Future<void> createUser(UserModel user) async {
    try {
      final auth = FirebaseAuth.instance;
      final db = FirebaseFirestore.instance;
      final credentials = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.senha,
      );
      final userId = credentials.user!.uid;

      await db.collection("usuarios").doc(userId).set(user.toMap());
    } catch (error) {
      debugPrint('ERROR (signIn) = $error');
      throw const ErrorModel(
        message:
            'Erro ao cadastrar usuário! Verifique os campos e tente novamente.',
      );
    }
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
      final map = query.data();

      if (map == null) {
        throw const ErrorModel(message: 'tipoUser nao encontrado');
      }
      final user = UserModel.fromMap(query.data()!);

      return user.tipoUser;
    } catch (error) {
      debugPrint('ERROR (getUserType) = $error');
      throw const ErrorModel(message: 'tipoUser nao encontrado');
    }
  }

  @override
  Future<void> solicitarColeta(RequisicaoModel requisicao) async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection("requisicoesColeta").add(requisicao.toMap());
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
      throw const ErrorModel(message: 'Erro na consulta de ponuação.');
    }
  }
  @override
  Future<bool> resgatarCupom(int pontuacao, UserModel user) async {
    try {
      bool resgatado = false;
      int pontuacaoAtual = await consultarPontuacao(user);
      if (pontuacaoAtual > pontuacao) {
        pontuacaoAtual = pontuacaoAtual - pontuacao;
        resgatado = true;
      } else{
        throw const ErrorModel(message: 'Erro no resgate de cupom.');
      }
      return resgatado;
    } catch (error) {
      debugPrint('ERROR (resgatarCupom) => $error');
      throw const ErrorModel(message: 'Erro no resgate de cupom.');
    }

  }

  @override
  Future<void> solicitarVisitaColetor(PredioModel predio, ApartamentoModel apartamento, CarrinhoModel carrinho) async {
    try {
      final db = FirebaseFirestore.instance;

      RequisicaoModel requisicao = RequisicaoModel(predio: predio, apartamento: apartamento, carrinho: carrinho);
      final docName = await db.collection("requisicoesVisita")
          .add(requisicao.toMap());
      await db.collection("requisicoesVisita")
          .doc(docName.toString())
          .update(requisicao.toMap());

    } catch (error) {
      debugPrint('ERROR (createPredio) => $error');
      throw const ErrorModel(message: 'Erro ao solicitar visita do coletor.');
    }
  }


  //REVISAR
  //ESSA
  //PARTE
  @override
  int carrinhoDeResiduo(){
   int a =1;
    return a;
}

    void liberarPontuacao(ApartamentoModel apartamento, UserModel user, int newScore){
      try{
        final db = FirebaseFirestore.instance;


      }catch (error) {
        debugPrint('ERROR (createPredio) => $error');
        throw const ErrorModel(message: 'Erro ao liberar pontuação.');
      }
}



}
