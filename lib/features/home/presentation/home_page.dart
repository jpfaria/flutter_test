import 'package:flutter/material.dart';

import '../../../main_layout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      child: Center(
        child: Text('Bem-vindo! Você está logado.'),
      ),
    );
  }
}