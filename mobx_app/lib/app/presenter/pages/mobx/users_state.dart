import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/app/domain/domain.dart';

part 'users_state.g.dart';

class UsersState = UsersBase with _$UsersState;

abstract class UsersBase with Store {
  final GetGithubUsersUseCase _getGithubUsersUseCase;

  @observable
  ObservableList<GithubUserEntity> users = <GithubUserEntity>[].asObservable();

  @observable
  Exception? error;

  @observable
  bool loading = true;

  UsersBase({
    required GetGithubUsersUseCase getGithubUsersUseCase
  }) : _getGithubUsersUseCase = getGithubUsersUseCase {
    _init();
  }

  Future<void> _init() async {
    try {
      users.addAll(await _getGithubUsersUseCase());
    } catch (e) {
      error = Exception('API error!');
    } finally {
      loading = false;
    }
  }
}
