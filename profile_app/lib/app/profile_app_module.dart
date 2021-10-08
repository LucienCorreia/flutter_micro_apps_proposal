import 'package:commons_dependencies/commons_dependencies.dart';

import 'presenter/pages/profile_page.dart';
import 'presenter/pages/profile_store.dart';

class ProfileAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => ProfileStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const ProfilePage(),
        ),
      ];
}
