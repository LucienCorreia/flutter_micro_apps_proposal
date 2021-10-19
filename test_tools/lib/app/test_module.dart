import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/core.dart';

class TestModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<Http>(
          (i) => Http(),
        ),
        Bind.factory<IGithubUserExternalDataSource>(
          (i) => GithubUserExternalDataSource(
            http: i.get(),
          ),
        ),
        Bind.factory<IGithubUserRepository>(
          (i) => GithubUserRepository(githubUserExternalDataSource: i.get()),
        ),
        Bind.factory(
          (i) => GetGithubUsersUseCase(
            githubUserRepository: i.get(),
          ),
        ),
      ];
}
