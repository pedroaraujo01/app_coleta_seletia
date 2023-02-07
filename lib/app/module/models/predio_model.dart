import 'apartamento_model.dart';

class PredioModel {
  final String nome;
  final int qntApt;
  final String rua;
  final int num;
  final int cep;
  final String cidade;
  final String bairro;
  final String idSindico;
  final String idPredio;
  final List<ApartamentoModel> apartamentos;

  const PredioModel({
    required this.nome,
    required this.qntApt,
    required this.rua,
    required this.num,
    required this.cep,
    required this.cidade,
    required this.bairro,
    required this.idSindico,
    required this.idPredio,
    required this.apartamentos,
  });

  factory PredioModel.fromMap(Map<String, dynamic> map) {
    return PredioModel(
      nome: map["nomePredio"],
      qntApt: map["qntApt"],
      rua: map["rua"],
      num: map["numero"],
      cep: map["cep"],
      cidade: map["cidade"],
      bairro: map["bairro"],
      idSindico: map["id_sindico"],
      idPredio: map["idPredio"],
      apartamentos: map["apartamentos"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "nomePredio": nome,
      "qntApt": qntApt,
      "rua": rua,
      "numero": num,
      "cep": cep,
      "cidade": cidade,
      "bairro": bairro,
      "id_sindico": idSindico,
      "idPredio": idPredio,
      "apartamentos": [],
    };
  }

  PredioModel copyWith({
    String? nome,
    int? qntApt,
    String? rua,
    int? num,
    int? cep,
    String? cidade,
    String? bairro,
    String? idSindico,
    String? idPredio,
    List<ApartamentoModel>? apartamentos,
  }) {
    return PredioModel(
      nome: nome ?? this.nome,
      qntApt: qntApt ?? this.qntApt,
      rua: rua ?? this.rua,
      num: num ?? this.num,
      cep: cep ?? this.cep,
      cidade: cidade ?? this.cidade,
      bairro: bairro ?? this.bairro,
      idSindico: idSindico ?? this.idSindico,
      idPredio: idPredio ?? this.idPredio,
      apartamentos: apartamentos ?? this.apartamentos,
    );
  }
}
