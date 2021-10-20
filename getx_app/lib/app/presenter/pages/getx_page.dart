import 'package:commons/commons.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import 'getx_store.dart';

class GetxPage extends StatefulWidget {
  const GetxPage({
    Key? key,
  }) : super(key: key);

  @override
  _GetxPageState createState() => _GetxPageState();
}

class _GetxPageState extends ModularState<GetxPage, GetxStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Page'),
        actions: const [
          SelectModuleWidget(),
        ],
      ),
      body: Obx(
        () {
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
