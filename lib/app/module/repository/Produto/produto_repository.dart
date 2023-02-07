// import 'package:app_coleta_seletiva/app/module/models/carrinho_model.dart';
// import 'package:app_coleta_seletiva/app/module/models/produto_model.dart';
// import 'package:app_coleta_seletiva/app/module/models/requisicao_model.dart';
// import 'package:app_coleta_seletiva/app/module/repository/Produto/i_produto_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../models/error_model.dart';
//
// class ProdutoRepository implements IProdutoRepository{
//
//   void adicionar(ProdutoModel produto){
//     produto.qnt = produto.qnt + 1;
//
//   }
//
//
//   Future<RequisicaoModel> fecharCarrinho(CarrinhoModel carrinho) async{
//     try{
//
//     }catch (error) {
//       debugPrint('ERROR (solicitarColeta) => $error');
//       throw const ErrorModel(message: 'Erro ao solicitar coleta.');
//     }
//   }
//
//
// }