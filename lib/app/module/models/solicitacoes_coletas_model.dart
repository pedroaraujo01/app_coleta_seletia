class SolicitacoesColeta {
  SolicitacoesColeta({
    required this.id,
    required this.title,
    required this.description,
    this.isExpanded = false,
  });

  int id;
  String title;
  String description;
  bool isExpanded;

  static List<SolicitacoesColeta> generateItems(int numberOfItems) {
    return List<SolicitacoesColeta>.generate(numberOfItems, (int index) {
      return SolicitacoesColeta(
        id: index + 1,
        title: 'Solicitação #2824${index + 1}',
        description: 'Descrição da solicitação #2824${index + 1}',
      );
    });
  }
}