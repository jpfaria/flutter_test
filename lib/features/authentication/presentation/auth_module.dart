import 'package:flutter_modular/flutter_modular.dart';
import 'auth_page.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    // A rota de autenticação
    r.child('/', child: (context) => AuthPage());
  }
}