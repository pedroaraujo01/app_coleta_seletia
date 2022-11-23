import 'package:app_coleta_seletiva/app/models/object_models/predio_modelo.dart';

class ListaPredioModelo {

  List<PredioModelo> _listaPredio = [];

  List get listaPredio => _listaPredio;


  void addPredio(Map<String, dynamic> predio){
    _listaPredio.add(PredioModelo.fromMap(predio));
    // notifyListeners();
  }

}