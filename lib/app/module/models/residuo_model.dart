class ResiduoModel {
  final List<int> vidro;
  final List<int> metal;
  final List<int> plastico;
  final List<int> papel;


  const ResiduoModel({
    required this.vidro,
    required this.metal,
    required this.plastico,
    required this.papel,
  });

  factory ResiduoModel.fromMap(Map<String, dynamic> map) {
    return ResiduoModel(
      vidro: map["vidro"],
      metal: map["metal"],
      plastico: map["plastico"],
      papel: map["papel"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "vidro": [50,100,150,200,250,300,350,400,450,500,550,600,1000, 1500],
      "metal": [100],
      "plastico": [100],
      "papel": [1, 5, 20, 50, 100, 250, 500]
    };
  }

  ResiduoModel copyWith({
    List<int>? vidro,
    List<int>? metal,
    List<int>? plastico,
    List<int>? papel,
  }) {
    return ResiduoModel(
      vidro: vidro ?? this.vidro,
      metal: metal ?? this.metal,
      plastico: plastico ?? this.plastico,
      papel: papel ?? this.papel,
    );
  }
}
