import 'package:app_coleta_seletiva/app/module/repository/user/i_user_repository.dart';
import 'package:mobx/mobx.dart';

part 'carrinho_controller.g.dart';

class CarrinhoController = CarrinhoControllerBase with _$CarrinhoController;

abstract class CarrinhoControllerBase with Store{
  final IUserRepository _userRepository;

  const CarrinhoControllerBase(
      this._userRepository
      );



}