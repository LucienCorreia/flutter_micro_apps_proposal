import 'package:commons_dependencies/commons_dependencies.dart';

import 'presenter/pages/mobx/users_state.dart';
import 'presenter/pages/mobx_page.dart';
import 'presenter/pages/mobx_store.dart';

class MobxAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => UsersState(
            getGithubUsersUseCase: i.get(),
          ),
        ),
        Bind.factory(
          (i) => MobxStore(
            state: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const MobxPage(),
        ),
      ];
}
