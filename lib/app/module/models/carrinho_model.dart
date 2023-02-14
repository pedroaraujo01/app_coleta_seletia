
import 'package:app_coleta_seletiva/app/module/models/produto_metal_model.dart';
import 'package:app_coleta_seletiva/app/module/models/produto_papel_model.dart';
import 'package:app_coleta_seletiva/app/module/models/produto_plastico_model.dart';
import 'package:app_coleta_seletiva/app/module/models/produto_vidro_model.dart';

class CarrinhoModel {
  int pontuacao;
  ProdutoMetalModel metalModel;
  ProdutoPapelModel papelModel;
  ProdutoPlasticoModel plasticoModel;
  ProdutoVidroModel vidroModel;
  String idMorador;
  String status;

  CarrinhoModel({
    required this.pontuacao,
    required this.metalModel,
    required this.papelModel,
    required this.plasticoModel,
    required this.vidroModel,
    required this.idMorador,
    required this.status,
});

  factory CarrinhoModel.fromMap(Map<String, dynamic> map) {
    return CarrinhoModel(
      pontuacao: map["pontuacao"],
      metalModel: map["metal"],
      papelModel: map["papel"],
      plasticoModel: map["plastico"],
      vidroModel: map["vidro"],
      idMorador: map["idMorador"],
      status: map["status"],
    );
  }

  Map<String, dynamic> toMap(){

    Map<String, dynamic> dadosMetal = {
      "qntMetal" : this.metalModel.qntMetal,
    };

    Map<String, dynamic> dadosPapel = {
      "qntPapel" : this.papelModel.qntPapel,
    };

    Map<String, dynamic> dadosPlastico = {
      "qntPlastico" : this.plasticoModel,
    };

    Map<String, dynamic> dadosVidro = {
      "350" : this.vidroModel.v350,
      "450" : this.vidroModel.v450,
      "500" : this.vidroModel.v500,
      "600" : this.vidroModel.v600,
      "800" : this.vidroModel.v800,
      "1000" : this.vidroModel.v1000,
    };

    Map<String, dynamic> dadosCarrinho = {
      "metal" : dadosMetal,
      "papel" : dadosPapel,
      "plastico" : dadosPlastico,
      "vidro" : dadosVidro,
      "pontuacao" : this.pontuacao,
      "idMorador" : this.idMorador,
      "status" : "aguardando"
    };

    return dadosCarrinho;
  }

//   CarrinhoModel copyWith({
//     int? pontTotal,
// }){
//     return CarrinhoModel(
//       pontuacao: pontuacao ?? this.pontuacao,
//     );
//   }





}