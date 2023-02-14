import 'package:app_coleta_seletiva/app/module/models/carrinho_model.dart';

import '../../models/predio_model.dart';
import '../../models/user_model.dart';

abstract class IUserRepository {
  bool userIsLogged();
  Future<String> getUserId();
  Future<String> getUserType();
  Future<void> solicitarColeta(CarrinhoModel carrinho);
  Future<int> consultarPontuacao(UserModel user);
  Future<void> atualizarPontuacao(int pontuacao, UserModel user);
  Future<void> solicitarVisita(CarrinhoModel carrinho);
  Future<Map<String, dynamic>> verificarSolicitacoes ();
  Future<void> aceitarSolicitacao();
  Future<Map<String, dynamic>> verificarSolicitacoesAceitas ();
  Future<void> salvarHistorico (CarrinhoModel carrinho);
  Future<Map<String, dynamic>> verificarHistorico ();
}
