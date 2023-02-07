class TipoColetaMorador {
  TipoColetaMorador({
    required this.id,
    required this.title,
    required this.description,
    this.isExpanded = false,
  });

  int id;
  String title;
  String description;
  bool isExpanded;

  static List<TipoColetaMorador> generateItems(int numberOfItems) {
    return List<TipoColetaMorador>.generate(numberOfItems, (int index) {
      return TipoColetaMorador(
        id: index + 1,
        title: 'Tipo de Coleta ${index + 1}',
        description: 'Descrição da coleta ${index + 1}',
      );
    });
  }
}