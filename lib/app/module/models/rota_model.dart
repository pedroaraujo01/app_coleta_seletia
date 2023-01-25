class RotaModel {
  final String rua;
  final String numero;
  final String cidade;
  final String bairro;
  final String cep;
  final double latitude;
  final double longitude;

  const RotaModel({
    required this.rua,
    required this.numero,
    required this.cidade,
    required this.bairro,
    required this.cep,
    required this.latitude,
    required this.longitude,
  });

  factory RotaModel.fromMap(Map<String, dynamic> map){
    return RotaModel(
        rua: map["rua"],
        numero: map["numero"],
        cidade: map["cidade"],
        bairro: map["bairro"],
        cep: map["cep"],
        latitude: map["latitude"],
        longitude: map["longitude"])
    ;
  }

  Map<String, dynamic> toMap(){
    return{
      "rua" : rua,
      "numero" : numero,
      "cidade" : cidade,
      "bairro" : bairro,
      "cep" : cep,
      "latitude" : latitude,
      "longitude" : longitude,
    };
  }
}
