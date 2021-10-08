import 'package:commons/app/widgets/user_widget.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import 'bloc/users_bloc.dart';
import 'bloc/users_states.dart';
import 'bloc_store.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({
    Key? key,
  }) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends ModularState<BlocPage, BlocStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Page'),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        bloc: controller.bloc,
        builder: (_, state) {
          if (state is UsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UsersErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }

          final users = (state as UsersDoneState).users;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) => UserWidget(
              login: users[index].login,
              avatarUrl: users[index].avatarUrl,
            ),
          );
        },
      ),
    );
  }
}
