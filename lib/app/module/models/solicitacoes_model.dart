import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Solicitacoes extends ChangeNotifier{
  String id;
  String title;
  String description;
  String status;
  int metal;
  int papel;
  int plastico;
  int vidro1000;
  int vidro350;
  int vidro450;
  int vidro500;
  int vidro600;
  int vidro800;

  SolicitacoesColeta({required this.description, required this.title,required this.id, required this.metal, required this.papel, required this.plastico, required this.vidro1000, required this.vidro350, required this.vidro450, required this.vidro500, required this.vidro600, required this.vidro800, required this.status});


  // Solicitacoes.fromDocument(DocumentSnapshot document){
  //   id = document.id;
  //   status = document['status'] as String;
  //   metal = document['metal'] as int;
  //   papel = document['papel'] as int;
  //   plastico = document['plastico'] as int;
  //   vidro1000 = document['vidro1000'] as int;
  //   vidro350 = document['vidro350'] as int;
  //   vidro450 = document['vidro450'] as int;
  //   vidro500 = document['vidro500'] as int;
  //   vidro600 = document['vidro600'] as int;
  //   vidro800 = document['vidro800'] as int;
  // }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.doc('solicitacoes/$id');
  Reference get storageRef => storage.ref().child('solicitacoes').child(id);

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> save() async {
    loading = true;

    final Map<String, dynamic> data = {
      'name': name,
      'description': description,
    };

    if(id == null){
      final doc = await firestore.collection('products').add(data);
      id = doc.id;
    } else {
      await firestoreRef.update(data);
    }


    loading = false;
  }
  @override
  String toString() {
    return 'Solicitacoes{id: $id, metal: $metal, papel: $papel, plastico: $plastico, vidro1000: $vidro1000,vidro350: $vidro350,vidro450: $vidro450, vidro500: $vidro500,vidro600: $vidro600,vidro800: $vidro800,}';
  }
  
}