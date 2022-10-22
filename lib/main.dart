import 'package:breaking_bad_app/src/app/app.dart';
import 'package:breaking_bad_app/src/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
