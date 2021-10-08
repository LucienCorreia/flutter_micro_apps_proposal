import '../../domain/entities/github_user_entity.dart';

class GithubUserModel extends GithubUserEntity {
  const GithubUserModel({
    required int id,
    required String login,
    required String avatarUrl,
  }) : super(
    id: id,
    login: login,
    avatarUrl: avatarUrl,
  );

  factory GithubUserModel.fromJson(Map<String, dynamic> json) {
    return GithubUserModel(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}
