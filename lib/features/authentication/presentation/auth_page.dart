import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../auth_bloc.dart';

class AuthPage extends StatelessWidget {
  final AuthBloc bloc = Modular.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticação'),
      ),
      body: BlocListener<AuthBloc, bool>(
        // Explicitly pass the bloc instance so it doesn't search for a provider in the widget tree
        bloc: bloc,
        listener: (context, isLoggedIn) {
          if (isLoggedIn) {
            // Navigate to home if logged in
            Modular.to.navigate('/');
          }
        },
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Trigger the login method
              bloc.login('exemplo@dominio.com', 'senha123');
            },
            child: Text('Login'),
          ),
        ),
      ),
    );
  }
}