class ProdutoVidroModel{
  int v350;
  int v450;
  int v500;
  int v600;
  int v800;
  int v1000;
  int totalItens;

  ProdutoVidroModel({
    required this.v350,
    required this.v450,
    required this.v500,
    required this.v600,
    required this.v800,
    required this.v1000,
    required this.totalItens,
});

  factory ProdutoVidroModel.fromMap(Map<String, dynamic> map) {
    return ProdutoVidroModel(
      v350: map["v350"],
      v450: map["v450"],
      v500: map["v500"],
      v600: map["v600"],
      v800: map["v800"],
      v1000: map["v1000"],
      totalItens: map["totalItens"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "v350" : v350,
      "v450" : v450,
      "v500" : v500,
      "v600" : v600,
      "v800" : v800,
      "v1000" : v1000,
      "totalItens" : totalItens
    };
  }

  ProdutoVidroModel copyWith({

    int? v350,
    int? v450,
    int? v500,
    int? v600,
    int? v800,
    int? v1000,
    int? totalItens,
}) {
    return ProdutoVidroModel(
      v350: v350 ?? this.v350,
      v450: v450 ?? this.v450,
      v500: v500 ?? this.v500,
      v600: v600 ?? this.v600,
      v800: v800 ?? this.v800,
      v1000: v1000 ?? this.v1000,
      totalItens: totalItens ?? this.totalItens
    );
  }



}