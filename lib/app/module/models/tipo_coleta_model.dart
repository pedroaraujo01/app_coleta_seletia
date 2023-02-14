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
}