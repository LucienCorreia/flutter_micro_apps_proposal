import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('BLoC'),
            onTap: () => Modular.to.pushNamed('/bloc'),
          ),
          ListTile(
            title: const Text('GetX'),
            onTap: () => Modular.to.pushNamed('/getx'),
          ),
          ListTile(
            title: const Text('MobX'),
            onTap: () => Modular.to.pushNamed('/mobx'),
          ),
          ListTile(
            title: const Text('Provider'),
            onTap: () => Modular.to.pushNamed('/provider'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.person,
        ),
        onPressed: () => Modular.to.pushNamed('/profile'),
      ),
    );
  }
}
