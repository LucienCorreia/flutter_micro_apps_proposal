import '../entities/github_user_entity.dart';

abstract class IGithubUserRepository {
  Future<List<GithubUserEntity>> getUsers();
}