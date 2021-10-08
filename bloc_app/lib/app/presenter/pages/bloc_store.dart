import 'package:commons_dependencies/commons_dependencies.dart';

import 'bloc/users_bloc.dart';
import 'bloc/users_events.dart';

class BlocStore implements Disposable {
  final UsersBloc _bloc;

  BlocStore({
    required UsersBloc bloc,
  }) : _bloc = bloc {
    bloc.add(const GetUsersEvent());
  }

  UsersBloc get bloc => _bloc;

  @override
  void dispose() {
    _bloc.close();
  }
}
