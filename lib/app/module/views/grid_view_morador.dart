import 'package:app_coleta_seletiva/app/module/controller/morador_controller.dart';
import 'package:app_coleta_seletiva/app/module/controller/user_controller.dart';
import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:app_coleta_seletiva/app/shared/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreenMorador extends StatefulWidget {
  @override
  _HomeScreenStateMorador createState() => _HomeScreenStateMorador();
}

class _HomeScreenStateMorador extends State<HomeScreenMorador> {
  AuthRepository auth = AuthRepository();
  UserController user = UserController();
  MoradorController morador = MoradorController();

  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = const TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 16,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Página Inicial"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.green,Colors.greenAccent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Seja bem vindo(a) Teste, ao aplicativo de auxílio a coleta de lixo do seu condomínio, você possui 100 pontos.',
                          style: TextStyle(
                              fontFamily: "Montserrat Medium",
                              color: Colors.black,
                              fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(Routes.resgatarCupons);
                          },
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: size.height * .165,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.topCenter,
                                        image: AssetImage('lib/app/imagens/cupom.png')),
                                  ),
                                ),
                                Text(
                                  'Resgatar Cumpom',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {

                            Modular.to.pushNamed(Routes.solicitarColetaMorador);
                          },
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: size.height * .165,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.topCenter,
                                        image: AssetImage('lib/app/imagens/solicitar_coleta.png')),
                                  ),
                                ),
                                Text(
                                  'Solicitar Coleta',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(Routes.historicoColetas);
                          },
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: size.height * .165,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.topCenter,
                                        image: AssetImage('lib/app/imagens/Historico.png')),
                                  ),
                                ),
                                Text(
                                  'Histórico de Coletas',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(Routes.dicasColeta);
                          },
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: size.height * .165,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.topCenter,
                                        image: AssetImage('lib/app/imagens/Dicas.png')),
                                  ),
                                ),
                                Text(
                                  'Dicas de Coleta',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(Routes.ajuda);
                          },
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: size.height * .165,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.topCenter,
                                        image: AssetImage('lib/app/imagens/ajuda.png')),
                                  ),
                                ),
                                Text(
                                  'Ajuda',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            auth.signOut();
                            user.checkUserIsLogged();
                          },
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: size.height * .165,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.topCenter,
                                        image: AssetImage('lib/app/imagens/Sair.png')),
                                  ),
                                ),
                                Text(
                                  'Sair',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
