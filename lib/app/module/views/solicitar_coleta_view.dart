import 'package:app_coleta_seletiva/app/module/controller/user_controller.dart';
import 'package:app_coleta_seletiva/app/module/models/tipo_coleta_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:app_coleta_seletiva/app/shared/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SolicitarColetaMoradorView extends StatefulWidget {
  const SolicitarColetaMoradorView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SolicitarColetaMoradorView createState() => _SolicitarColetaMoradorView();
}

class _SolicitarColetaMoradorView extends State<SolicitarColetaMoradorView> {
  AuthRepository auth = AuthRepository();
  UserController user = UserController();
  int _350v = 0;
  int _450v = 0;
  int _500v = 0;
  int _600v = 0;
  int _800v = 0;
  int _1000v = 0;

  String _infoText = "Pode Entrar!";

  void _350(int delta){
    setState(() {
      _350v += delta;
    });
  }
  void _450(int delta){
    setState(() {
      _450v += delta;
    });
  }
  void _500(int delta){
    setState(() {
      _500v += delta;
    });
  }
  void _600(int delta){
    setState(() {
      _600v += delta;
    });
  }
  void _800(int delta){
    setState(() {
      _800v += delta;
    });
  }

  void _1000(int delta){
    setState(() {
      _1000v += delta;
    });
  }

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
        title: Text("Solicitar Coleta"),
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
                            'Realize a solicitação da sua coleta aqui',
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
                          expansionCallback: (int index, bool isExpanded){},
                          children: [
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  title: Text('Vidro'),
                                );
                              },
                              body: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '350mL',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 22),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "+1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _350(1);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "$_350v",
                                        style:
                                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "-1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _350(-1);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '450mL',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 22),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "+1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _450(1);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "$_450v",
                                        style:
                                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "-1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _450(-1);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '500mL',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 22),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "+1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _500(1);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "$_500v",
                                        style:
                                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "-1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _500(-1);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '600mL',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 22),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "+1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _600(1);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "$_600v",
                                        style:
                                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "-1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _600(-1);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '800mL',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 22),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "+1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _800(1);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "$_800v",
                                        style:
                                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "-1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _800(-1);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '1000mL',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 22),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "+1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _1000(1);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "$_1000v",
                                        style:
                                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "-1",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _1000(-1);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              isExpanded: true,
                            ),
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  title: Text('Plástico'),
                                );
                              },
                              body: const Padding(
                                padding: EdgeInsets.all(15),
                                child: TextField(
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                      hintText: "valor em gramas",
                                      filled: true,
                                      fillColor: Colors.green,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                            ),
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  title: Text('Papel'),
                                );
                              },
                              body: const Padding(
                                padding: EdgeInsets.all(15),
                                child: TextField(
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    hintText: "Insira o valor em gramas...",
                                    filled: true,
                                    fillColor: Colors.green,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                            ),
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  title: Text('Metal'),
                                );
                              },
                              body: const Padding(
                                padding: EdgeInsets.all(15),
                                child: TextField(
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    hintText: "Insira o valor em gramas...",
                                    filled: true,
                                    fillColor: Colors.green,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      style: style,
                      onPressed: () {
                        Modular.to.pushNamed(Routes.painelMorador);
                      },
                      child: const Text('Salvar'),
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
