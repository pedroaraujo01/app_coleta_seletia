import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController _controllerUsuario = TextEditingController(text: "coletor@c.com");
  TextEditingController _controllerSenha = TextEditingController(text: "123abcd");
  String _mensagemErro= "";
  bool _carregando = false;
  AuthRepository auth = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Decoration Corpo
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/app/imagens/fundo.png",),
              fit: BoxFit.cover
          ),
        ),

        //Container Conteudo
        padding: EdgeInsets.all(32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                //Padding Logo
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
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
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                    onPressed: (){
                      auth.signIn(_controllerUsuario.text, _controllerSenha.text);

                    },
                  ),
                ),

                //Carregando
                _carregando
                    ? Center(child: CircularProgressIndicator(backgroundColor: Colors.yellow,),)
                    : Container(),

                //Mensagem Erro
                Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Center(
                      child: Text(
                        _mensagemErro,
                        style: TextStyle(
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
