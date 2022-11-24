class ApartamentoModel {
  final int numApt;
  final String idUser;
  final String idPredio;
  final String idApartamento;

  const ApartamentoModel({
    required this.numApt,
    required this.idUser,
    required this.idPredio,
    required this.idApartamento,
  });

  factory ApartamentoModel.fromMap(Map<String, dynamic> map) {
    return ApartamentoModel(
      numApt: map["numApt"],
      idUser: map["idUser"],
      idPredio: map["idPredio"],
      idApartamento: map["idApartamento"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "numApt": numApt,
      "idUser": idUser,
      "idPredio": idPredio,
      "idApartamento": idApartamento
    };
  }

  ApartamentoModel copyWith({
    int? numApt,
    String? idUser,
    String? idPredio,
    String? idApartamento,
  }) {
    return ApartamentoModel(
      numApt: numApt ?? this.numApt,
      idUser: idUser ?? this.idUser,
      idPredio: idPredio ?? this.idPredio,
      idApartamento: idApartamento ?? this.idApartamento,
    );
  }
}
