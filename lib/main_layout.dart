import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpfaria_test_app/features/authentication/auth_bloc.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String title;

  const MainLayout({Key? key, required this.child, this.title = 'Home'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = Modular.get<AuthBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Modular.to.navigate('/');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
                Modular.to.navigate('/profile');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                authBloc.logout();
                Modular.to.navigate('/auth/');
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}