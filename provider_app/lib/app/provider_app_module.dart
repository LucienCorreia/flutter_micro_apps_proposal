import 'package:commons_dependencies/commons_dependencies.dart';

import 'presenter/pages/provider_page.dart';
import 'presenter/pages/provider_store.dart';

class ProviderAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => ProviderStore(
            getGithubUsersUseCase: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const ProviderPage(),
        ),
      ];
}
