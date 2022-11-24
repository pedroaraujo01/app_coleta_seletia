import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/apartamento_model.dart';
import '../../models/error_model.dart';
import 'i_apartamento_repository.dart';

class ApartamentoRepository implements IApartamentoRepository {
  @override
  Future<void> create(ApartamentoModel value) async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection("requisicoesApartamentos").add(value.toMap());
    } catch (error) {
      debugPrint('ERROR (createApartamento) => $error');
      throw const ErrorModel(message: 'Erro ao criar um Apartamento');
    }
  }

  @override
  Future<ApartamentoModel> get(String userId) async {
    try {
      final db = FirebaseFirestore.instance;
      final query = await db
          .collection("requisicoesApartamentos")
          .where("idSindico", isEqualTo: userId)
          .get();

      final value = query.docs.first.data();
      return ApartamentoModel.fromMap(value);
    } catch (error) {
      debugPrint('ERROR (getApartamento) => $error');
      throw const ErrorModel(message: 'Erro na busca do Apartamento');
    }
  }

  @override
  Future<void> update(ApartamentoModel value) async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection("predio").doc(value.idPredio).update(value.toMap());
    } catch (error) {
      debugPrint('ERROR (updateApartamento) => $error');
      throw const ErrorModel(message: 'Erro ao atualizar um apartamento');
    }
  }

  @override
  Future<void> delete(ApartamentoModel value) async {
    try {
      final db = FirebaseFirestore.instance;
      await db
          .collection('predio')
          .doc(value.idPredio)
          .collection('apartamentos')
          .doc(value.idApartamento)
          .delete();

      // final db = FirebaseFirestore.instance;
      // final query = await db
      //     .collection("predio")
      //     .where("idPredio", isEqualTo: value.idPredio)
      //     .get();

      // final map = query.docs.first.data();
      // final predio = PredioModel.fromMap(map);
      // final list = predio.apartamentos;
      // list.removeWhere((i) => i.idApartamento == value.idApartamento);
      // predio.copyWith(apartamentos: list);
      // await db.collection('predio').doc(value.idPredio).update(predio.toMap());
    } catch (error) {
      debugPrint('ERROR (deleteApartamento) => $error');
      throw const ErrorModel(message: 'Erro ao deletar um apartamento');
    }
  }
}
