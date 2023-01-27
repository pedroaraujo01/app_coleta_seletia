import 'controller/morador_controller.dart';
import 'controller/sindico_controller.dart';
import 'repository/auth/i_auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_routes.dart';
import 'controller/auth_controller.dart';
import 'controller/user_controller.dart';
import 'repository/auth/auth_repository.dart';
import 'repository/predio/i_predio_repository.dart';
import 'repository/predio/predio_repository.dart';
import 'repository/user/i_user_repository.dart';
import 'repository/user/user_repository.dart';
import 'views/login_view.dart';
import 'views/painel_morador_view.dart';
import 'views/not_found_view.dart';
import 'views/painel_sindico_view.dart';

class ColetaSeletivaModule extends Module {
  @override
  final List<Bind> binds = [
    // Repository
    Bind.lazySingleton<IPredioRepository>((i) => PredioRepository()),
    Bind.lazySingleton<IAuthRepository>((i) => AuthRepository()),
    Bind.lazySingleton<IUserRepository>((i) => UserRepository()),

    // Controllers
    Bind.lazySingleton((i) => MoradorController(i.get(), i.get(),)),
    Bind.lazySingleton((i) => SindicoController(i.get(), i.get())),
    Bind.lazySingleton((i) => AuthController()),
    Bind.lazySingleton((i) => UserController()),
  ];

  @override
  final List<ModularRoute> routes = [
    WildcardRoute(
      transition: TransitionType.fadeIn,
      child: (context, args) => const NotFoundView(),
    ),
    ChildRoute(
      Modular.initialRoute,
      transition: TransitionType.noTransition,
      child: (_, args) => const LoginView(),
    ),
    ChildRoute(
      Paths.painelMorador,
      transition: TransitionType.fadeIn,
      child: (_, args) => const PainelMoradorView(),
    ),
    ChildRoute(
      Paths.painelSindico,
      transition: TransitionType.fadeIn,
      child: (_, args) => const PainelSindicoView(),
    ),
  ];
}
