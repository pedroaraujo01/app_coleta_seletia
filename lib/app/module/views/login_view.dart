import 'package:app_coleta_seletiva/app/module/coleta_seletiva_module.dart';
import 'package:app_coleta_seletiva/app/module/controller/user_controller.dart';
import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:app_coleta_seletiva/app/shared/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController _controllerUsuario = TextEditingController(text: "a@a.com");
  final TextEditingController _controllerSenha = TextEditingController(text: "123456a");
  final String _mensagemErro= "";
  final bool _carregando = false;
  AuthRepository auth = AuthRepository();
  UserController user = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Decoration Corpo
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/app/imagens/fundo.png",),
              fit: BoxFit.cover
          ),
        ),

        //Container Conteudo
        padding: const EdgeInsets.all(32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                //Padding Logo
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "lib/app/imagens/logo.png",
                    width: 200,
                    height: 200,
                  ),
                ),

                //Campo Email
                TextField(
                  controller: _controllerUsuario,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                ),

                //Campo Senha
                TextField(
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                ),

                //Botão Login
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                    onPressed: (){
                      auth.signIn(_controllerUsuario.text, _controllerSenha.text);
                      user.getUserTypeById();
                    },
                  ),
                ),

                //Carregando
                _carregando
                    ? const Center(child: CircularProgressIndicator(backgroundColor: Colors.yellow,),)
                    : Container(),

                //Mensagem Erro
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Text(
                        _mensagemErro,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20
                        ),
                      ),
                    )
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
