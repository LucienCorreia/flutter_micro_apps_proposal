import 'package:flutter/material.dart';
import 'package:mobx_app/app/mobx_app_module.dart';
import 'package:test_tools/test_tools.dart';

void main() {
  runApp(
    runModule(
      module: MobxAppModule(),
      useTestModule: true,
      binds: [],
    ),
  );
}
