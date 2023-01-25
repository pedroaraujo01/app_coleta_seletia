import 'package:app_coleta_seletiva/app/module/models/predio_model.dart';
import 'package:app_coleta_seletiva/app/module/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/error_model.dart';
import 'i_predio_repository.dart';

class PredioRepository implements IPredioRepository {
  @override
  Future<void> create(PredioModel value, UserModel user) async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection("predios").add(value.toMap());

      Map<String, dynamic> idPredios = Map();
      idPredios[value.nome] = [value.idPredio];
      await db.collection("sindicos")
          .doc(user.cpf.toString())
          .collection("idsPredios")
          .add(idPredios);
    } catch (error) {
      debugPrint('ERROR (createPredio) => $error');
      throw const ErrorModel(message: 'Erro ao criar um predio');
    }
  }

  @override
  Future<PredioModel> get(int cep, String name, String address) async {
    try {
      final db = FirebaseFirestore.instance;
      final query = await db
          .collection("predios")
          .where("cep", isEqualTo: cep.toString())
          .where("nomePredio", isEqualTo: name)
          .where("endereco", isEqualTo: address)
          .get();
      final value = query.docs.first.data();
      return PredioModel.fromMap(value);
    } catch (error) {
      debugPrint('ERROR (getPredio) => $error');
      throw const ErrorModel(message: 'Erro na busca do predio');
    }
  }

  @override
  Future<void> update(PredioModel value) async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection("predios").doc(value.idPredio).update(value.toMap());
    } catch (error) {
      debugPrint('ERROR (updateApartamento) => $error');
      throw const ErrorModel(message: 'Erro ao atualizar um Predio');
    }
  }

  @override
  Future<void> delete(PredioModel value) async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection("predios").doc(value.idPredio).delete();
    } catch (error) {
      debugPrint('ERROR (deletePredio) => $error');
      throw const ErrorModel(message: 'Erro ao deletar um Predio');
    }
  }
}
