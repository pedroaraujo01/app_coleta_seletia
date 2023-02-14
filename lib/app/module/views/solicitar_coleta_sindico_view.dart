import 'package:app_coleta_seletiva/app/module/controller/user_controller.dart';
import 'package:app_coleta_seletiva/app/module/models/tipo_coleta_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:app_coleta_seletiva/app/shared/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SolicitarColetaSindicoView extends StatefulWidget {
  const SolicitarColetaSindicoView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SolicitarColetaSindicoView createState() => _SolicitarColetaSindicoView();
}

class _SolicitarColetaSindicoView extends State<SolicitarColetaSindicoView> {
  AuthRepository auth = AuthRepository();
  UserController user = UserController();
  // final List<TipoColetaMorador> _tipocoleta = TipoColetaMorador.generateItems(4);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
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
        title: Text("Solicitar Coleta Sindico"),
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
              child: SingleChildScrollView(
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
                            'Realize a solicitação das coletas aqui.',
                            style: TextStyle(
                                fontFamily: "Montserrat Medium",
                                color: Colors.black,
                                fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {},
                          children: [
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  title: Text('Item 1'),
                                );
                              },
                              body: const ListTile(
                                title: Text('Item 1 child'),
                                subtitle: Text('Details goes here'),
                              ),
                              isExpanded: true,
                            ),
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  title: Text('Item 2'),
                                );
                              },
                              body: const ListTile(
                                title: Text('Item 2 child'),
                                subtitle: Text('Details goes here'),
                              ),
                              isExpanded: false,
                            ),
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  title: Text('Item 2'),
                                );
                              },
                              body: const ListTile(
                                title: Text('Item 2 child'),
                                subtitle: Text('Details goes here'),
                              ),
                              isExpanded: false,
                            ),
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  title: Text('Item 2'),
                                );
                              },
                              body: const ListTile(
                                title: Text('Item 2 child'),
                                subtitle: Text('Details goes here'),
                              ),
                              isExpanded: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      style: style,
                      onPressed: () {},
                      child: const Text('Enviar Solicitação'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
