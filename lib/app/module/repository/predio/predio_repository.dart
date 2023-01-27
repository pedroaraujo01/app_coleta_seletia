import 'package:app_coleta_seletiva/app/module/models/predio_model.dart';
import 'package:app_coleta_seletiva/app/module/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/error_model.dart';
import 'i_predio_repository.dart';

class PredioRepository implements IPredioRepository {


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
}
