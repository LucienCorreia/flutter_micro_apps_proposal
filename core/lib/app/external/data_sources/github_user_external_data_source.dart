import '../../domain/entities/github_user_entity.dart';
import '../../infra/data_sources/github_user_external_data_source.dart';
import '../../infra/models/github_user_model.dart';
import '../http/http.dart';

class GithubUserExternalDataSource implements IGithubUserExternalDataSource {
  final Http _http;

  GithubUserExternalDataSource({
    required Http http,
  }) : _http = http;

  @override
  Future<List<GithubUserEntity>> getUsers() async {
    final response = await _http.get('https://api.github.com/users');

    return (response.data as Iterable)
        .map((e) => GithubUserModel.fromJson(e))
        .toList();
  }
}
