import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpfaria_test_app/features/authentication/presentation/auth_module.dart';
import 'package:jpfaria_test_app/features/home/presentation/home_module.dart';
import 'package:jpfaria_test_app/auth_guard.dart';
import 'package:jpfaria_test_app/features/authentication/auth_bloc.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // Registra o AuthBloc globalmente para que ele seja acessível no AuthGuard e em outras partes do app.
    i.addSingleton<AuthBloc>(AuthBloc.new);
  }

  @override
  void routes(RouteManager r) {
    // A rota principal usa o AuthGuard; se o usuário não estiver logado, será redirecionado para /auth/
    r.module('/', module: HomeModule(), guards: [AuthGuard()]);
    r.module('/auth/', module: AuthModule());
  }
}