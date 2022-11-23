class Requisicao_Modelo{
  final String id;
  final String idMorador;
  final String idSindico;
  final String idPredio;
  final int numApt;

  Requisicao_Modelo(
      {required this.id,
        required this.idMorador,
        required this.idSindico,
        required this.idPredio,
        required this.numApt
      });

  Map<String, dynamic> toMap(){

    Map<String, dynamic> dadosRequisicao = {
      "idRequisicao" : this.id,
      "idMorador" : this.idMorador,
      "idSindico" : this.idSindico,
      "idPredio" : this.idPredio,
      "numApt" : this.numApt
    };
    return dadosRequisicao;
  }




}