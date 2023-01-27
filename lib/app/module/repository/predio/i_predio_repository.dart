import '../../models/predio_model.dart';

abstract class IPredioRepository {
  Future<PredioModel> get(int cep, String nome, String address);
}
