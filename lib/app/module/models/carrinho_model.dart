import 'package:app_coleta_seletiva/app/module/models/produto_model.dart';

class CarrinhoModel {
  final int pontTotal;
  final List<ProdutoModel> produto;

  const CarrinhoModel({
    required this.pontTotal,
    required this.produto
});

  factory CarrinhoModel.fromMap(Map<String, dynamic> map) {
    return CarrinhoModel(
      pontTotal: map["pontTotal"],
      produto: map ["produto"],
    );
  }

  Map<String, dynamic> toMap(){
    return{
      "pontTotal": pontTotal,
      "produto": produto
    };
  }

  CarrinhoModel copyWith({
    int? pontTotal,
    List<ProdutoModel>? produto,
}){
    return CarrinhoModel(
      pontTotal: pontTotal ?? this.pontTotal,
      produto: produto ?? this.produto,
    );
  }





}