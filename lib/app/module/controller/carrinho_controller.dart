import 'package:app_coleta_seletiva/app/module/models/produto_metal_model.dart';
import 'package:app_coleta_seletiva/app/module/models/produto_plastico_model.dart';
import 'package:app_coleta_seletiva/app/module/models/produto_vidro_model.dart';
import 'package:app_coleta_seletiva/app/module/repository/user/i_user_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/carrinho_model.dart';
import '../models/produto_papel_model.dart';
import '../repository/user/user_repository.dart';

part 'carrinho_controller.g.dart';

class CarrinhoController = CarrinhoControllerBase with _$CarrinhoController;

abstract class CarrinhoControllerBase with Store{
  final IUserRepository _userRepository;

  const CarrinhoControllerBase(
      this._userRepository
      );

  Future<ProdutoVidroModel> vidroModel(int item1, int item2, int item3, int item4, int item5, int item6) async{

    int totalItem = item1 + item2 + item3 + item4 + item5 + item6;
    ProdutoVidroModel produto = ProdutoVidroModel(v350: item1, v450: item2, v500: item3, v600: item4, v800: item5, v1000: item6, totalItens: totalItem);
    return produto;
  }

  Future<ProdutoPlasticoModel> plasticoModel (int item) async {

    ProdutoPlasticoModel produto = ProdutoPlasticoModel(qntPlastico: item);
    return produto;
  }

  Future<ProdutoPapelModel> papelModel (int item) async {

    ProdutoPapelModel produto = ProdutoPapelModel(qntPapel: item);
    return produto;
  }

  Future<ProdutoMetalModel> metalModel (int item) async {

    ProdutoMetalModel produto = ProdutoMetalModel(qntMetal: item);
    return produto;
  }

  Future<int> multiplicarVidro(ProdutoVidroModel produto) async{
    int totalItens = produto.v350 + produto.v450 + produto.v500 + produto.v600 + produto.v800 + produto.v1000;
    int pontTotal = totalItens * 100;

    return pontTotal;

  }
  Future<int> pontuacaoTotal (int papel, int plastico, int metal, int vidro) async{
    int pontTotal = papel + plastico + metal + vidro;

    return pontTotal;
  }

  Future<CarrinhoModel> montarCarrinho(ProdutoPapelModel papelModel, ProdutoVidroModel vidroModel, ProdutoPlasticoModel plasticoModel, ProdutoMetalModel metalModel) async {
    int pontuacao = await pontuacaoTotal(papelModel.qntPapel, plasticoModel.qntPlastico, metalModel.qntMetal, vidroModel.totalItens);
    final repository = UserRepository();
    String userID = await repository.getUserId();
    String status = "Aguardando";
    CarrinhoModel carrinhoModel = await CarrinhoModel(pontuacao: pontuacao, metalModel: metalModel, papelModel: papelModel, plasticoModel: plasticoModel, vidroModel: vidroModel, idMorador: userID, status: status);

    return carrinhoModel;


  }



}