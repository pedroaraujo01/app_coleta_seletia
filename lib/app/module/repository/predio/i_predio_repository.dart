import '../../models/predio_model.dart';

abstract class IPredioRepository {
  Future<PredioModel> get(int cep, String nome, String address);
  Future<void> create(PredioModel value);
  Future<void> update(PredioModel value);
  Future<void> delete(PredioModel value);
}
