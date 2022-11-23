import 'package:app_coleta_seletiva/app/controller/object_controller/pagina_controller.dart';
import 'package:app_coleta_seletiva/app/models/user_models/usuario_modelo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class UsuarioController {



  cadastrarUsuario(Usuario usuario) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    auth.createUserWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha
    ).then((firebaseUser) {
      db.collection("usuarios")
          .doc(firebaseUser.user!.uid)
          .set(usuario.toMap());

    }).catchError((error){
      return "Erro ao cadastrar usuário! Verifique os campos e tente novamente.";
    });
  }




  verificarUsuarioLogado(context)async{

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    User? usuarioLogado = await auth.currentUser!;

    if (usuarioLogado != null){
      return usuarioLogado.uid.toString();
    } else {
      logOut(context);
      return "Você não está logado, por favor faça o login antes de realizar esta ação!";
    }
  }




  editarUsuario(Usuario usuario) async {

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("usuarios")
    .doc(auth.currentUser!.uid)
    .update(usuario.toMap());
  }




  logIn(context, email, senha) {
    PaginaController pagecont = PaginaController();
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    ).then((firebaseUser){

      pagecont.redirecionarPaginaPorTipoUser(context, firebaseUser.user!.uid);

    }).catchError((error){
      return "Erro de autenticação! Verifique seus dados e tente novamente";
    });
  }



  logOut(context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/");
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
