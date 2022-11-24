import 'package:mobx/mobx.dart';

part 'coletor_controller.g.dart';

class ColetorController = ColetorControllerBase with _$ColetorController;

abstract class ColetorControllerBase with Store {
  void tracarRota() {}

  void adicionarPontucao() {}

  void atualizarRota() {}

  void checkpoint() {}
}
