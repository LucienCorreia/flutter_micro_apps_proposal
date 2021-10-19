library test_tools;

import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_tools/app/test_module.dart';

Widget runModule({
  required Module module,
  List<Bind> binds = const [],
  bool useTestModule = false,
}) {
  final changeBinds = [
    ...binds,
    ...module.binds,
  ];

  if (useTestModule) changeBinds.addAll(TestModule().binds);

  module.changeBinds(changeBinds);

  module.binds;

  return ModularApp(
    module: module,
    child: const AppTest(),
  );
}

class AppTest extends StatefulWidget {
  const AppTest({
    Key? key,
  }) : super(key: key);

  @override
  _AppTestState createState() => _AppTestState();
}

class _AppTestState extends State<AppTest> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp().modular();
  }
}
