import 'package:commons_dependencies/commons_dependencies.dart';

import 'presenter/pages/home_page.dart';
import 'presenter/pages/home_store.dart';

class HomeAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => HomeStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const HomePage(),
        ),
      ];
}
