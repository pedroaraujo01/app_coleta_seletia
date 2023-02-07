import 'package:app_coleta_seletiva/app/module/controller/user_controller.dart';
import 'package:app_coleta_seletiva/app/module/models/solicitacoes_coletas_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:app_coleta_seletiva/app/shared/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SolicitacoesColetaSindicoView extends StatefulWidget {
  const SolicitacoesColetaSindicoView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SolicitacoesColetaSindicoView createState() => _SolicitacoesColetaSindicoView();
}

class _SolicitacoesColetaSindicoView extends State<SolicitacoesColetaSindicoView> {
  AuthRepository auth = AuthRepository();
  UserController user = UserController();
  final List<SolicitacoesColeta> _solicitacoesColeta = SolicitacoesColeta.generateItems(4);

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
        title: Text("Solicitações de Coleta"),
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
                          'Acompanhe as solitações dos moradores do prédio.',
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
                          setState(() => _solicitacoesColeta[index].isExpanded = !isExpanded);
                        },
                        children: _solicitacoesColeta.map<ExpansionPanel>((SolicitacoesColeta product) {
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
