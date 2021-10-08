import '../../domain/entities/github_user_entity.dart';
import '../../domain/repositories/github_user_repository.dart';
import '../data_sources/github_user_external_data_source.dart';

class GithubUserRepository extends IGithubUserRepository {
  final IGithubUserExternalDataSource _githubUserExternalDataSource;

  GithubUserRepository({
    required IGithubUserExternalDataSource githubUserExternalDataSource,
  }) : _githubUserExternalDataSource = githubUserExternalDataSource;

  @override
  Future<List<GithubUserEntity>> getUsers() {
    return _githubUserExternalDataSource.getUsers();
  }
}
