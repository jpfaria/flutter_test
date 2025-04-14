import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jpfaria_test_app/app/app_module.dart';
import 'package:jpfaria_test_app/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<Map<String, dynamic>> loadConfig() async {
  final String jsonString = await rootBundle.loadString('assets/config.json');
  return json.decode(jsonString);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
