import 'package:app_coleta_seletiva/app/models/object_models/apartamento_modelo.dart';
class PredioModelo {

  final String nome;
  final int qntApt;
  final String rua;
  final int num;
  final int cep;
  final String cidade;
  final String bairro;
  final String idSindico;
  final String idPredio;


  PredioModelo(
      {required this.nome,
        required this.qntApt,
        required this.rua,
        required this.num,
        required this.cep,
        required this.cidade,
        required this.bairro,
        required this.idSindico,
        required this.idPredio
      });

  factory PredioModelo.fromMap(Map<String, dynamic> map){
    return PredioModelo(
      nome: map["nomePredio"],
      qntApt: map["qntApt"],
      rua: map["rua"],
      num: map["numero"],
      cep: map["cep"],
      cidade: map["cidade"],
      bairro: map["bairro"],
      idSindico: map["id_sindico"],
      idPredio: map["idPredio"]
    );
  }

  Map<String, dynamic> toMap() {

    Map<String, dynamic> predio = {
      "nomePredio": this.nome,
      "qntApt": this.qntApt,
      "rua": this.rua,
      "numero": this.num,
      "cep": this.cep,
      "cidade": this.cidade,
      "bairro": this.bairro,
      "id_sindico": this.idSindico,
      "idPredio" : this.idPredio,
      "apartamenos" : List<ApartamentoModelo>,
    };

    return predio;
  }


}