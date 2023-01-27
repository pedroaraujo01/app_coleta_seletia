class UserModel {
  final String nome;
  final String endereco;
  final String cidade;
  final String bairro;
  final int num;
  final int cep;
  final int cpf;
  final String tel;
  final String dtNasc;
  final String email;
  final String tipoUser;
  final int pontuacao;

  const UserModel({
    required this.nome,
    required this.endereco,
    required this.cidade,
    required this.bairro,
    required this.num,
    required this.cep,
    required this.cpf,
    required this.tel,
    required this.dtNasc,
    required this.email,
    required this.tipoUser,
    required this.pontuacao,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map["nome"],
      endereco: map["endereco"],
      cidade: map["cidade"],
      bairro: map["bairro"],
      num: map["num"],
      cep: map["cep"],
      cpf: map["cpf"],
      tel: map["tel"],
      dtNasc: map["dtNasc"],
      email: map["email"],
      tipoUser: map["tipoUser"],
      pontuacao: map["pontuacao"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "endereco": endereco,
      "cidade": cidade,
      "bairro": bairro,
      "num": num,
      "cep": cep,
      "cpf": cpf,
      "tel": tel,
      "dtNasc": dtNasc,
      "email": email,
      "tipoUser": tipoUser,
      "pontuacao": 0
    };
  }

  UserModel copyWith({
    String? nome,
    String? endereco,
    String? cidade,
    String? bairro,
    int? num,
    int? cep,
    int? cpf,
    String? tel,
    String? dtNasc,
    String? email,
    String? tipoUser,
    int? pontuacao,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      endereco: endereco ?? this.endereco,
      cidade: cidade ?? this.cidade,
      bairro: bairro ?? this.bairro,
      num: num ?? this.num,
      cep: cep ?? this.cep,
      cpf: cpf ?? this.cpf,
      tel: tel ?? this.tel,
      dtNasc: dtNasc ?? this.dtNasc,
      email: email ?? this.email,
      tipoUser: tipoUser ?? this.tipoUser,
      pontuacao: pontuacao ?? this.pontuacao,
    );
  }
}
