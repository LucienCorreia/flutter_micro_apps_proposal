import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

class SelectModuleWidget extends StatelessWidget {
  const SelectModuleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (route) => Modular.to.pushReplacementNamed(route),
      itemBuilder: (_) => [
        const PopupMenuItem<String>(
          value: '/bloc',
          child: Text('BLoC'),
        ),
        const PopupMenuItem<String>(
          value: '/getx',
          child: Text('GetX'),
        ),
        const PopupMenuItem<String>(
          value: '/mobx',
          child: Text('MobX'),
        ),
        const PopupMenuItem<String>(
          value: '/provider',
          child: Text('Provider'),
        ),
      ],
      icon: const Icon(Icons.menu),
    );
  }
}
