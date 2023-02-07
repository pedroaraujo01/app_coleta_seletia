import '../../models/apartamento_model.dart';

abstract class IApartamentoRepository {
  // Future<List<String>> get(String userId);
  Future<void> update(ApartamentoModel value);
  Future<void> delete(ApartamentoModel value);
  Future<void> create(ApartamentoModel value);
  Future<void> liberarCadastroApartamento(ApartamentoModel value);
}
