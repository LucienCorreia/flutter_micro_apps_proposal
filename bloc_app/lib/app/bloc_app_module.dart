import 'package:commons_dependencies/commons_dependencies.dart';

import 'presenter/pages/bloc/users_bloc.dart';
import 'presenter/pages/bloc_page.dart';
import 'presenter/pages/bloc_store.dart';

class BlocAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => UsersBloc(
            getGithubUsersUseCase: i.get(),
          ),
        ),
        Bind.factory(
          (i) => BlocStore(
            bloc: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const BlocPage(),
        ),
      ];
}
