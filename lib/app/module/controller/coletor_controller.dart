import 'package:app_coleta_seletiva/app/module/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'coletor_controller.g.dart';

class ColetorController = ColetorControllerBase with _$ColetorController;

abstract class ColetorControllerBase with Store {



  void tracarRota() {}

  void adicionarPontucao(UserModel user, ) {}

  void atualizarRota() {}

  void checkpoint() {}
}
