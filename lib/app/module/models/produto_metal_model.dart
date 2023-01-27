class ProdutoMetalModel{
  int qntMetal;

  ProdutoMetalModel({
    required this.qntMetal,
});

  factory ProdutoMetalModel.fromMap(Map<String, dynamic> map) {
    return ProdutoMetalModel(
      qntMetal: map["qntMetal"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "qntMetal" : qntMetal,
    };
  }

  ProdutoMetalModel copyWith({

    int? qntMetal,
}) {
    return ProdutoMetalModel(
      qntMetal: qntMetal ?? this.qntMetal,
    );
  }



}