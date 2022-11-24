class RequisicaoModel {
  final String id;
  final String idMorador;
  final String idSindico;
  final String idPredio;
  final int numApt;

  const RequisicaoModel({
    required this.id,
    required this.idMorador,
    required this.idSindico,
    required this.idPredio,
    required this.numApt,
  });

  Map<String, dynamic> toMap() {
    return {
      "idRequisicao": id,
      "idMorador": idMorador,
      "idSindico": idSindico,
      "idPredio": idPredio,
      "numApt": numApt
    };
  }
}
