class ProdutoModel{
  final String tipo;
  final String nome;
  final int pontuacao;

  const ProdutoModel({
    required this.tipo,
    required this.nome,
    required this.pontuacao,
});

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      tipo: map["tipo"],
      nome: map["nome"],
      pontuacao: map["pontuacao"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "tipo" : tipo,
      "nome" : nome,
      "pontuacao" : pontuacao,
    };
  }

  ProdutoModel copyWith({
    String? tipo,
    String? nome,
    int? pontuacao,
}) {
    return ProdutoModel(
      tipo: tipo ?? this.tipo,
      nome: nome ?? this.nome,
      pontuacao: pontuacao ?? this.pontuacao,
    );
  }



}