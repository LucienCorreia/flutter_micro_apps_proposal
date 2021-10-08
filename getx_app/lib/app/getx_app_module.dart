import 'package:commons_dependencies/commons_dependencies.dart';

import 'presenter/pages/getx/users_state.dart';
import 'presenter/pages/getx_page.dart';
import 'presenter/pages/getx_store.dart';

class GetxAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => UsersState(
            getGithubUsersUseCase: i.get(),
          ),
        ),
        Bind.factory(
          (i) => GetxStore(
            state: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const GetxPage(),
        ),
      ];
}
