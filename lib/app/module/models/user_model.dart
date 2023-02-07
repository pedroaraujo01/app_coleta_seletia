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
  final String tipoMoradia;
  final String email;
  final String senha;
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
    required this.tipoMoradia,
    required this.email,
    required this.senha,
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
      tipoMoradia: map["tipoMoradia"],
      email: map["email"],
      senha: map["senha"],
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
      "numero": num,
      "cep": cep,
      "cpf": cpf,
      "tel": tel,
      "dtNascimento": dtNasc,
      "tipoMoradia": tipoMoradia,
      "email": email,
      "tipoUser": tipoUser,
      "pontuacao": 0
    };
  }

  String verifyUserType(bool isMoradia) => isMoradia ? "APARTAMENTO" : "CASA";
}
