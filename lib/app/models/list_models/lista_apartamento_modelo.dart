import '../object_models/apartamento_modelo.dart';

class ListaApartamentoModelo {

  List<ApartamentoModelo> _listaApartamento = [];

  List get listaPredio => _listaApartamento;


  void addApartamento(Map<String, dynamic> predio){
    _listaApartamento.add(ApartamentoModelo.fromMap(predio));
    // notifyListeners();
  }
  
  void removeApartamento(ApartamentoModelo apartamento){
    _listaApartamento.remove((value)=> apartamento.numApt == value.id);
  }

}