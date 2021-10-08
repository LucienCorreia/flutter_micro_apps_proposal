import 'package:commons_dependencies/commons_dependencies.dart';

class GithubUserEntity extends Equatable {
  final int id;
  final String login;
  final String avatarUrl;

  const GithubUserEntity({
    required this.id,
    required this.login,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [
        id,
        login,
        avatarUrl,
      ];
}
