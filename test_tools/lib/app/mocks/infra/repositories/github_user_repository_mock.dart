import 'package:core/core.dart';

class GithubUserRepositoryMock implements IGithubUserRepository {
  @override
  Future<List<GithubUserEntity>> getUsers() async {
    return [];
  }
}
