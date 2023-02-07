class ApartamentoModel {
  final int numApt;
  final String nomeMorador;
  final String nomePredio;
  final String idPredio;
  final String cpfMorador;

  const ApartamentoModel({
    required this.numApt,
    required this.nomeMorador,
    required this.nomePredio,
    required this.idPredio,
    required this.cpfMorador,
  });

  factory ApartamentoModel.fromMap(Map<String, dynamic> map) {
    return ApartamentoModel(
      numApt: map["numApt"],
      nomeMorador: map["nomeMorador"],
      nomePredio: map["nomePredio"],
      idPredio: map["idPredio"],
      cpfMorador: map["cpfMorador"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "numApt": numApt,
      "idUser": nomeMorador,
      "nomePredio": nomePredio,
      "idPredio": idPredio,
      "cpfMorador" : cpfMorador,
    };
  }

  ApartamentoModel copyWith({
    int? numApt,
    String? nomeMorador,
    String? nomePredio,
    String? idPredio,
    String? cpfMorador,
  }) {
    return ApartamentoModel(
      numApt: numApt ?? this.numApt,
      nomeMorador: nomeMorador ?? this.nomeMorador,
      nomePredio: nomePredio ?? this.nomePredio,
      idPredio: idPredio ?? this.idPredio,
      cpfMorador: cpfMorador ?? this.cpfMorador,
    );
  }
}
