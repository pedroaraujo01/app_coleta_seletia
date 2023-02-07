import 'package:app_coleta_seletiva/app/module/controller/user_controller.dart';
import 'package:app_coleta_seletiva/app/module/repository/auth/auth_repository.dart';
import 'package:app_coleta_seletiva/app/shared/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repository/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AjudaView extends StatefulWidget {
  const AjudaView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AjudaView createState() => _AjudaView();
}

class _AjudaView extends State<AjudaView> {
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
        title: Text("Ajuda"),
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
                    height: 490,
                    margin: EdgeInsets.only(bottom: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Em caso de dúvidas ou problemas, entre em contato através dos contatos abaixo:',
                          style: TextStyle(
                              fontFamily: "Montserrat Medium",
                              color: Colors.black,
                              fontSize: 20,
                          ),
                        ),
                        SizedBox(   //Use of SizedBox
                          height: 280,
                        ),
                      Text(
                        '(11) 3265-9685',
                        style: TextStyle(
                          fontFamily: "Montserrat Medium",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                        SizedBox(   //Use of SizedBox
                          height: 30,
                        ),
                      Text(
                        'coleta@suporte.com',
                        style: TextStyle(
                          fontFamily: "Montserrat Medium",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                        SizedBox(   //Use of SizedBox
                          height: 30,
                        ),
                      Text(
                        '(11)9 9265-9685',
                        style: TextStyle(
                          fontFamily: "Montserrat Medium",
                          color: Colors.black,
                          fontSize: 20,
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
