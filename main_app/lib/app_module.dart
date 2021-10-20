import 'package:bloc_app/bloc_app.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/app/domain/domain.dart';
import 'package:core/app/external/external.dart';
import 'package:core/core.dart';
import 'package:getx_app/getx_app.dart';
import 'package:home_app/home_app.dart';
import 'package:mobx_app/mobx_app.dart';
import 'package:provider_app/provider_app.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => Http(),
        ),
        Bind.factory(
          (i) => GetGithubUsersUseCase(
            githubUserRepository: i.get(),
          ),
        ),
        Bind.factory<IGithubUserRepository>(
          (i) => GithubUserRepository(githubUserExternalDataSource: i.get()),
        ),
        Bind.factory<IGithubUserExternalDataSource>(
          (i) => GithubUserExternalDataSource(
            http: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: HomeAppModule(),
        ),
        ModuleRoute(
          '/bloc',
          module: BlocAppModule(),
        ),
        ModuleRoute(
          '/getx',
          module: GetxAppModule(),
        ),
        ModuleRoute(
          '/mobx',
          module: MobxAppModule(),
        ),
        ModuleRoute(
          '/provider',
          module: ProviderAppModule(),
        ),
      ];
}
