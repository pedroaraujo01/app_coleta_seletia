class ProdutoPapelModel{
  int qntPapel;

  ProdutoPapelModel({
    required this.qntPapel,
});

  factory ProdutoPapelModel.fromMap(Map<String, dynamic> map) {
    return ProdutoPapelModel(
      qntPapel: map["qntPapel"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "qntPapel" : qntPapel,
    };
  }

  ProdutoPapelModel copyWith({

    int? qntPapel,
}) {
    return ProdutoPapelModel(
      qntPapel: qntPapel ?? this.qntPapel,
    );
  }



}