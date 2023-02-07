import 'package:app_coleta_seletiva/app/module/controller/user_controller.dart';
import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:app_coleta_seletiva/app/shared/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoricoColetasView extends StatefulWidget {
  const HistoricoColetasView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HistoricoColetasView createState() => _HistoricoColetasView();
}

class _HistoricoColetasView extends State<HistoricoColetasView> {
  AuthRepository auth = AuthRepository();
  UserController user = UserController();

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
        title: Text("Histórico de Coletas"),
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
                          'Acompanhe seu histórico de coletas.',
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
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      primary: false,
                      crossAxisCount: 1,
                      children: <Widget>[
                    Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Card(
                            color: Colors.grey[100],
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text(
                                      "Pedido: #158654",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(height: 10),
                                    ListTile(
                                      title: Text('Itens'),
                                      subtitle: Text('450 mL'),
                                    ),
                                    SizedBox(height: 10),
                                    ListTile(
                                      title: Text('Pontuação'),
                                      subtitle: Text('120 pontos'),
                                    ),
                                    SizedBox(height: 10),
                                    ListTile(
                                      title: Text('Data'),
                                      subtitle: Text('07/02/2023'),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
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
