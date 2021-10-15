import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/app/domain/domain.dart';

import 'users_events.dart';
import 'users_states.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetGithubUsersUseCase _getGithubUsersUseCase;

  UsersBloc({required GetGithubUsersUseCase getGithubUsersUseCase})
      : _getGithubUsersUseCase = getGithubUsersUseCase,
        super(const UsersLoadingState()) {
    on<GetUsersEvent>(_getUsers);
  }

  Future<void> _getUsers(GetUsersEvent event, Emitter<UsersState> emit) async {
    emit(const UsersLoadingState());

    try {
      final users = await _getGithubUsersUseCase();

      emit(UsersDoneState(users));
    } catch (e) {
      emit(const UsersErrorState());
    }
  }
}
