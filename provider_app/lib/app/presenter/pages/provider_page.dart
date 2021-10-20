import 'package:commons/commons.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import 'provider_store.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({
    Key? key,
  }) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends ModularState<ProviderPage, ProviderStore> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderStore>.value(
      value: controller,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider Page'),
          actions: const [
            SelectModuleWidget(),
          ],
        ),
        body: Consumer<ProviderStore>(
          builder: (_, state, __) {
            if (state.loading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.error != null) {
              return const Center(
                child: Text('Error'),
              );
            }

            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, index) => UserWidget(
                login: state.users[index].login,
                avatarUrl: state.users[index].avatarUrl,
              ),
            );
          },
        ),
      ),
    );
  }
}
