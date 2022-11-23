import 'package:app_coleta_seletiva/app/controller/user_controller/usuario_controller.dart';
import 'package:app_coleta_seletiva/app/models/list_models/lista_apartamento_modelo.dart';
import 'package:app_coleta_seletiva/app/models/object_models/predio_modelo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/object_models/apartamento_modelo.dart';
import '../../models/object_models/requisicao_modelo.dart';

class SindicoController extends UsuarioController{

  solicitarVisitaColetor(){

  }

  liberarPontuacao(){

  }

  cadastrarPredio(PredioModelo predio) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("predio")
    .add(predio.toMap());
  }

  buscarApartamento(ListaApartamentoModelo listaApartamento) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await db.collection("requisicoesApartamentos")
        .where("idSindico", isEqualTo: verificarUsuarioLogado(""))
        .get();

    for(DocumentSnapshot item in querySnapshot.docs){
      listaApartamento.addApartamento(item.data() as Map<String, dynamic>);
      return listaApartamento;
    }
  }

  liberarCadastroApartamento(ApartamentoModelo apartamento) async {

    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection("predio")
    .doc(apartamento.idPredio)
    .update(apartamento as Map<String,dynamic>);


  }

  removerCadastroApartamento(ApartamentoModelo apartamento, ListaApartamentoModelo listaApartamento) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

   QuerySnapshot querySnapshot = await db.collection("predio")
        .where("idPredio", isEqualTo: apartamento.idPredio.toString())
        .get();

   for(DocumentSnapshot item in querySnapshot.docs){
     Map<String, dynamic> predio = item.data() as Map<String,dynamic>;
     List<Map<String, dynamic>> listaApartamento = predio["apartamentos"];
     if(listaApartamento == apartamento){

       db.collection("predios")
       .doc(apartamento.idPredio)
       .update(data)
     }
   }
  }

  removerPredio(){

  }
}