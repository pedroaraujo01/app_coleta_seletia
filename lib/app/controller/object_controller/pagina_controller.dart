import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PaginaController{

  redirecionarPaginaPorTipoUser(context, idUsuario) async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios")
        .doc(idUsuario)
        .get();

    Map<String,dynamic> dados = snapshot.data() as Map<String,dynamic>;
    String tipoUser = dados["tipoUser"];

    tipoUser = dados['tipoUser'];
    switch (tipoUser) {
      case "" :
        Navigator.pushReplacementNamed(context, "/");
        break;
      case "morador" :
        Navigator.pushReplacementNamed(context, "/painel-morador");
        break;
      case "sindico" :
        Navigator.pushReplacementNamed(context, "/painel-sindico");
        break;
      case "coletor" :
        Navigator.pushReplacementNamed(context, "/painel-coletor");
        break;
    }

  }

  static Route<dynamic>? gerarCaminhos(RouteSettings settings){

    switch(settings.name){
      // case "/":
      //   return MaterialPageRoute(
      //       builder: (_) => //Classe da Página aqui();
      //   );

      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: Text("Tela não encontrada!"),
            ),
            body: Center(
              child: Text("Tela não encontrada!"),
            ),
          );
        }
    );
  }

}