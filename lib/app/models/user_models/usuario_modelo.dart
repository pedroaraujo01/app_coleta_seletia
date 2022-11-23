// part 'usuario_modelo.g.dart';
// class UsuarioBase = Usuario with UsuarioBase;

class Usuario{

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


  Usuario(
      {required this.nome,
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
        required this.pontuacao
      });




  factory Usuario.fromMap(Map<String,dynamic> map){
    return Usuario(
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



  Map<String,dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome" : this.nome,
      "endereco" : this.endereco,
      "cidade" : this.cidade,
      "bairro" : this.bairro,
      "numero" : this.num,
      "cep" : this.cep,
      "cpf" : this.cpf,
      "tel" : this.tel,
      "dtNascimento" : this.dtNasc,
      "tipoMoradia" : this.tipoMoradia,
      "email" : this.email,
      "tipoUser" : this.tipoUser,
      "pontuacao" : 0
    };

    return map;
  }

  String verificaTipoUser(bool moradia){
    return moradia ? "APARTAMENTO" : "CASA";
  }

}