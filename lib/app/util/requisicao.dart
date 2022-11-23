//
//
// class Requisicao {
//
//   late String _id;
//   late String _status;
//   late Usuario _passageiro;
//   late Usuario _motorista;
//   late Rotas _rotas;
//
//   Requisicao(){
//     FirebaseFirestore db = FirebaseFirestore.instance;
//
//     DocumentReference ref = db.collection("requisicoes").doc();
//     this.id = ref.id;
//   }
//
//   Map<String,dynamic> toMap(){
//
//     Map<String, dynamic> dadosPassageiro = {
//       "nome" : this.passageiro.nome,
//       "email" : this.passageiro.email,
//       "tipoUser" : this.passageiro.tipoUser,
//       "idUser" : this.passageiro.idUser
//
//     };
//
//     Map<String, dynamic> dadosRotas = {
//       "rua" : this.rotas.rua,
//       "numero" : this.rotas.numero,
//       "bairro" : this.rotas.bairro,
//       "cep" : this.rotas.cep,
//       "latitude" : this.rotas.latitude,
//       "longitude" : this.rotas.longitude,
//
//
//     };
//
//
//     Map<String, dynamic> dadosRequisicao = {
//       "status" : this.status,
//       "passageiro" : dadosPassageiro,
//       "motorista" : null,
//       "rota" : dadosRotas,
//       "id" : this.id
//
//     };
//
//     return dadosRequisicao;
//   }
//
//
//   Rotas get rotas => _rotas;
//
//   set rotas(Rotas value) {
//     _rotas = value;
//   }
//
//   Usuario get motorista => _motorista;
//
//   set motorista(Usuario value) {
//     _motorista = value;
//   }
//
//   Usuario get passageiro => _passageiro;
//
//   set passageiro(Usuario value) {
//     _passageiro = value;
//   }
//
//   String get status => _status;
//
//   set status(String value) {
//     _status = value;
//   }
//
//   String get id => _id;
//
//   set id(String value) {
//     _id = value;
//   }
//
// }