import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/app/domain/domain.dart';

class UsersState {
  final GetGithubUsersUseCase _getGithubUsersUseCase;

  final _users = RxList<GithubUserEntity>();
  final _error = Rx<Exception?>(null);
  final _loading = RxBool(true);

  List<GithubUserEntity> get users => _users;
  Exception? get error => _error.value;
  bool get loading => _loading.value;

  UsersState({
    required GetGithubUsersUseCase getGithubUsersUseCase
  }) : _getGithubUsersUseCase = getGithubUsersUseCase {
    _init();
  }

  Future<void> _init() async {
    try {
      _users.addAll(await _getGithubUsersUseCase());
    } catch (e) {
      _error.value = Exception('API error!');
    } finally {
      _loading.value = false;
    }
  }
}
