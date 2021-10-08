import '../../domain/entities/github_user_entity.dart';

abstract class IGithubUserExternalDataSource {
  Future<List<GithubUserEntity>> getUsers();
}