import '../../models/user_model.dart';

abstract class IUserRepository {
  bool userIsLogged();
  Future<void> createUser(UserModel user);
  Future<void> editUser(UserModel newUser);
  Future<String> getUserId();
  Future<String> getUserType();
}
