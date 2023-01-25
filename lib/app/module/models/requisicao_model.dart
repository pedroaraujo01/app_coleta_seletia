import 'package:app_coleta_seletiva/app/module/models/apartamento_model.dart';
import 'package:app_coleta_seletiva/app/module/models/carrinho_model.dart';
import 'package:app_coleta_seletiva/app/module/models/predio_model.dart';

class RequisicaoModel {
  final PredioModel predio;
  final CarrinhoModel carrinho;
  final ApartamentoModel apartamento;

  const RequisicaoModel({
    required this.predio,
    required this.carrinho,
    required this.apartamento,

  });

  factory RequisicaoModel.fromMap(Map<String, dynamic> map){
    return RequisicaoModel(
    predio: map["predio"],
        carrinho: map["carrinho"],
    apartamento: map["apartamento"]
    );
  }

  Map<String, dynamic> toMap() {

    Map<String, dynamic> dadosPredio = {
      "nome" : this.predio.nome,
      "qntApt" : this.predio.qntApt,
      "rua" : this.predio.rua,
      "num" : this.predio.num,
      "cep" : this.predio.cep,
      "cidade" : this.predio.cidade,
      "bairro" : this.predio.bairro,
      "idSindico" : this.predio.idSindico,
      "idPredio" : this.predio.idPredio,
      "apartamentos" : this.predio.apartamentos,
    };

    Map<String, dynamic> dadosCarrinho = {
      "pontTotal" : this.carrinho.pontTotal,
      "produto" : this.carrinho.produto,

    };

    Map<String, dynamic> dadosApartamento = {
      "numApt" : this.apartamento.numApt,
      "nomeMorador" : this.apartamento.nomeMorador,
      "nomePredio" : this.apartamento.nomePredio,
      "idPredio" : this.apartamento.idPredio,
      "cpfMorador" : this.apartamento.cpfMorador,
    };

    Map<String, dynamic> dadosRequisicao = {
      "predio" : dadosPredio,
      "residuo" : dadosCarrinho,
      "apartamento" : dadosApartamento,
    };

    return dadosRequisicao;

    // return {
    //   "idRequisicao": id,
    //   "predio": predio,
    //   "residuo": residuo,
    // };
  }
}
