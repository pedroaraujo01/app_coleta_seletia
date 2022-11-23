import 'package:app_coleta_seletiva/app/controller/user_controller/usuario_controller.dart';
import 'package:app_coleta_seletiva/app/models/list_models/lista_predio_modelo.dart';
import 'package:app_coleta_seletiva/app/models/object_models/apartamento_modelo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MoradorController extends UsuarioController{

  solicitarColetaSindico(){

  }

  resgatarCupom(){

  }

  buscarPredio(int cep, String nomePredio, String endereco, ListaPredioModelo listaPredio) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await db.collection("predio")
    .where("cep", isEqualTo: cep.toString())
    .where("nomePredio", isEqualTo: nomePredio)
    .where("endereco", isEqualTo: endereco)
    .get();

    for(DocumentSnapshot item in querySnapshot.docs){
     listaPredio.addPredio(item.data() as Map<String, dynamic>);
     return listaPredio;
    }
  }

  cadastrarApartamento(ApartamentoModelo apartamento){
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection("requisicoesApartamentos")
    .add(apartamento.toMap());
  }

  removerApartamento(ApartamentoModelo apartamento){

  }

}