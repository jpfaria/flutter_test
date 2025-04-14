import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpfaria_test_app/features/authentication/auth_bloc.dart';

class AuthGuard extends RouteGuard {
  // Redireciona para '/auth/' se a autenticação falhar
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  Future<bool> canActivate(String url, ModularRoute route) async {
    // Obtém o AuthBloc que agora está registrado globalmente no AppModule
    final authBloc = Modular.get<AuthBloc>();

    // Verifica o estado atual de autenticação (true = logado, false = não logado)
    bool isLoggedIn = authBloc.state;

    return isLoggedIn;
  }
}