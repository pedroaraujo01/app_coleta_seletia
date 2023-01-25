import 'package:app_coleta_seletiva/app/module/models/apartamento_model.dart';
import 'package:app_coleta_seletiva/app/module/models/carrinho_model.dart';

import '../../models/predio_model.dart';
import '../../models/requisicao_model.dart';
import '../../models/user_model.dart';

abstract class IUserRepository {
  bool userIsLogged();
  Future<void> createUser(UserModel user);
  Future<void> editUser(UserModel newUser);
  Future<String> getUserId();
  Future<String> getUserType();
  Future<void> solicitarColeta(RequisicaoModel requisicao);
  Future<int> consultarPontuacao(UserModel user);
  Future<bool> resgatarCupom(int pontuacao, UserModel user);
  Future<void> solicitarVisitaColetor(PredioModel predio, ApartamentoModel apartamento, CarrinhoModel carrinho);
  int carrinhoDeResiduo();
}
