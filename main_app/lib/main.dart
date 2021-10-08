import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
