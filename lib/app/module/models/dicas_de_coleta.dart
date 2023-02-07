class Dicas {
  Dicas({
    required this.id,
    required this.title,
    required this.description,
    this.isExpanded = false,
  });

  int id;
  String title;
  String description;
  bool isExpanded;

  static List<Dicas> generateItems(int numberOfItems) {
    return List<Dicas>.generate(numberOfItems, (int index) {
      return Dicas(
        id: index + 1,
        title: 'Dica ${index + 1}',
        description: 'Descrição da dica ${index + 1}',
      );
    });
  }
}