import 'package:commons/app/widgets/user_widget.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import 'mobx_store.dart';

class MobxPage extends StatefulWidget {
  const MobxPage({
    Key? key,
  }) : super(key: key);

  @override
  _MobxPageState createState() => _MobxPageState();
}

class _MobxPageState extends ModularState<MobxPage, MobxStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX Page'),
      ),
      body: Observer(
        builder: (_) {
          if (controller.state.loading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.state.error != null) {
            return const Center(
              child: Text('Error'),
            );
          }

          return ListView.builder(
            itemCount: controller.state.users.length,
            itemBuilder: (_, index) => UserWidget(
              login: controller.state.users[index].login,
              avatarUrl: controller.state.users[index].avatarUrl,
            ),
          );
        },
      ),
    );
  }
}
