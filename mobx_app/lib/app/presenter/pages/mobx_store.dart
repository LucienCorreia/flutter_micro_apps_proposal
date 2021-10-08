import 'package:commons_dependencies/commons_dependencies.dart';

import 'mobx/users_state.dart';

class MobxStore implements Disposable {
  final UsersState _state;

  MobxStore({
    required UsersState state,
  }) : _state = state;

  UsersState get state => _state;

  @override
  void dispose() {}
}
