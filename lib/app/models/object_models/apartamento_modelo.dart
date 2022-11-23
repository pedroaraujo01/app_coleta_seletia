
import 'predio_modelo.dart';

class ApartamentoModelo{

  final int numApt;
  final String idUser;
  final String idPredio;
  final String idApartamento;

  ApartamentoModelo(
      {required this.numApt,
        required this.idUser,
        required this.idPredio,
        required this.idApartamento
  });

  factory ApartamentoModelo.fromMap(Map<String, dynamic> map){
    return ApartamentoModelo(
        numApt: map["numApt"],
        idUser: map["idUser"],
        idPredio: map["idPredio"],
        idApartamento: map["idApartamento"]
    );
  }

  Map<String, dynamic> toMap(){

    Map<String, dynamic> dadosApartamento ={
      "numApt" : this.numApt,
      "idUser" : this.idUser,
      "idPredio" : this.idPredio,
      "idApartamento" : this.idApartamento
    };
    return dadosApartamento;
  }

}