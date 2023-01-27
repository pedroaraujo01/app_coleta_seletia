class ProdutoPlasticoModel{
  int qntPlastico;

  ProdutoPlasticoModel({
    required this.qntPlastico,
});

  factory ProdutoPlasticoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoPlasticoModel(
      qntPlastico: map["qntPlastico"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "qntPlastico" : qntPlastico,
    };
  }

  ProdutoPlasticoModel copyWith({

    int? qntPlastico,
}) {
    return ProdutoPlasticoModel(
      qntPlastico: qntPlastico ?? this.qntPlastico,
    );
  }



}