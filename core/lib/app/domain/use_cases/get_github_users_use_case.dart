import '../entities/github_user_entity.dart';
import '../repositories/github_user_repository.dart';

class GetGithubUsersUseCase {
  final IGithubUserRepository _githubUserRepository;

  GetGithubUsersUseCase({
    required IGithubUserRepository githubUserRepository,
  }) : _githubUserRepository = githubUserRepository;

  Future<List<GithubUserEntity>> call() async {
    return _githubUserRepository.getUsers();
  }
}
