import 'package:app_coleta_seletiva/app/module/controller/user_controller.dart';
import 'package:app_coleta_seletiva/app/module/models/dicas_de_coleta.dart';
import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:app_coleta_seletiva/app/shared/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DicasColetaView extends StatefulWidget {
  const DicasColetaView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DicasColetaView createState() => _DicasColetaView();
}

class _DicasColetaView extends State<DicasColetaView> {
  AuthRepository auth = AuthRepository();
  UserController user = UserController();
  final List<Dicas> _dicas = Dicas.generateItems(4);

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
        title: Text("Dicas de Coleta"),
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
                          'Acompanhe as dicas para coleta.',
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
                      child: ExpansionPanelList.radio(
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() => _dicas[index].isExpanded = !isExpanded);
                        },
                        children: _dicas.map<ExpansionPanel>((Dicas product) {
                          return ExpansionPanelRadio(
                            // isExpanded: product.isExpanded,
                            value: product.id,
                            canTapOnHeader: true,
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return ListTile(
                                leading: CircleAvatar(child: Text(product.id.toString())),
                                title: Text(product.title),
                              );
                            },
                            body: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text(product.description),
                                ),
                                // Image.network('https://picsum.photos/id/${product.id}/500/300'),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
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
