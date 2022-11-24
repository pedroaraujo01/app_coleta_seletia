abstract class Routes {
  Routes._();

  static const painelMorador = '${Paths.painelMorador}/';
  static const painelSindico = '${Paths.painelSindico}/';
  static const painelColetor = '${Paths.painelColetor}/';
}

abstract class Paths {
  Paths._();

  static const painelMorador = '/painel-morador';
  static const painelSindico = '/painel-sindico';
  static const painelColetor = '/painel-coletor';
}
