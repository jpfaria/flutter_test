import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    // A rota de autenticação
    r.child('/', child: (context) => HomePage());
  }
}