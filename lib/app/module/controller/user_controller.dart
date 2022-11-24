import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/auth_repository.dart';
import '../repository/user/user_repository.dart';
import '../../shared/app_routes.dart';
import '../models/error_model.dart';
import '../models/user_model.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  //flutter packages pub run build_runner watch --delete-conflicting-outputs
  Future<void> createUser(UserModel user) async {
    try {
      final repository = UserRepository();
      repository.createUser(user);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  Future<void> editUser(UserModel user) async {
    try {
      final repository = UserRepository();
      repository.editUser(user);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  void checkUserIsLogged() {
    final userRepository = UserRepository();
    final authRepository = AuthRepository();

    final isLogged = userRepository.userIsLogged();
    if (!isLogged) {
      authRepository.signOut();
      debugPrint(
        "Você não está logado, por favor faça o login antes de realizar esta ação!",
      );
      Modular.to.pushNamed(Modular.initialRoute);
    }
  }

  Future<void> getUserTypeById() async {
    try {
      final repository = UserRepository();
      final type = await repository.getUserType();
      openPageByUserType(type);
    } on ErrorModel catch (error) {
      debugPrint(error.message);
    }
  }

  void openPageByUserType(String type) {
    switch (type) {
      case "":
        Modular.to.pushNamed(Modular.initialRoute);
        break;
      case "morador":
        Modular.to.pushNamed(Routes.painelMorador);
        break;
      case "sindico":
        Modular.to.pushNamed(Routes.painelSindico);
        break;
      case "coletor":
        Modular.to.pushNamed(Routes.painelColetor);
        break;
    }
  }
}



// abstract class UsuarioControllerBase with Store{
//
//   UsuarioController usuariocontrolller = UsuarioController();
//
//   @observable late String nome;
//   @observable late String endereco;
//   @observable late String cidade;
//   @observable late String bairro;
//   @observable late String num;
//   @observable late String cep;
//   @observable late String cpf;
//   @observable late String tel;
//   @observable late String dtNasc;
//   @observable late String tipoMoradia;
//   @observable late String email;
//   @observable late String senha;
//   @observable late String tipoUser;
//
//   @computed
//   validarNome(String nome, String endereco){
//     if(nome.isNotEmpty && endereco.isNotEmpty){
//     } else{
//       return "Este campo é obrigatório";
//     }
//
//   }
//   validarCampos(
//       String nome,
//       String endereco,
//       String cidade,
//       String bairro,
//       String num,
//       String cep,
//       String cpf,
//       String tel,
//       String dtNasc,
//       String tipoMoradia,
//       String email,
//       String senha,
//       String tipoUser,) {
//     if (nome.isNotEmpty && endereco.isNotEmpty && cidade.isNotEmpty &&
//         bairro.isNotEmpty && num.isNotEmpty) {
//       //If cep
//       if (cep.isNotEmpty && cep.length == 8) {
//         //If CPF
//         if (cpf.isNotEmpty && cpf.length == 11) {
//           //If telefone
//           if (tel.isNotEmpty && tel.length == 13) {
//             //If Data de Nascimento
//             if (dtNasc.isNotEmpty && dtNasc.length == 10) {
//               //If Email
//               if (email.isNotEmpty && email.contains("@")) {
//                 //If Senha 1
//                 if (senha.isNotEmpty) {
//                   //If senha 2
//                   if (senha.length > 6) {
//                     Usuario usuario = Usuario.fromMap({
//                       "nome": nome,
//                       "endereco": endereco,
//                       "cidade": cidade,
//                       "bairro": bairro,
//                       "numero": int.parse(num),
//                       "cep": int.parse(cep),
//                       "cpf": int.parse(cpf),
//                       "tel": tel,
//                       "dtNasc": dtNasc,
//                       "email": email,
//                       "tipoMoradia": tipoMoradia,
//                       "tipoUser": 'morador'
//                     });
//
//                     usuariocontrolller.cadastrarUsuario(usuario);
//                     //Else senha 2
//                   } else {
//                     return "Preencha a senha!";
//                   }
//                   //Else Senha 1
//                 } else {
//                   return "Senha inválida!";
//                 }
//                 //Else Email
//               } else {
//                 return "Email no formato inválido.";
//               }
//               //Else Data de Nascimento
//             } else {
//               return "Data de Nascimento no formato inválido.";
//             }
//             //Else Telefone
//           } else {
//             return "Telefone no formato inválido.";
//           }
//           //Else CPF
//         } else {
//           return "CPF Inválido. Reveja a informação!";
//         }
//         //Else Nome, Endereco, Cidade, Bairo, Num, Cep
//       } else {
//         return "CEP no formato Inválido!";
//       }
//     } else {
//       return "Preencha todos os Campos!";
//     }
//     return 'Erro Inesperado';
//   }
// }
