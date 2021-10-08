import 'package:commons_dependencies/commons_dependencies.dart';

import 'getx/users_state.dart';

class GetxStore implements Disposable {
  final UsersState _state;

  GetxStore({
    required UsersState state,
  }) : _state = state;

  UsersState get state => _state;

  @override
  void dispose() {}
}
