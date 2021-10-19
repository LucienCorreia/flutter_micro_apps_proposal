import 'package:bloc_app/app/presenter/pages/bloc/users_bloc.dart';
import 'package:bloc_app/app/presenter/pages/bloc/users_events.dart';
import 'package:bloc_app/app/presenter/pages/bloc/users_states.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/app/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import 'users_bloc_test.mocks.dart';

abstract class GithubUserRepository extends Mock
    implements IGithubUserRepository {}

@GenerateMocks([
  GithubUserRepository,
])
void main() {
  late MockGithubUserRepository githubUserRepositoryMock;
  late GetGithubUsersUseCase getGithubUsersUseCase;
  late UsersBloc usersBloc;

  setUp(() {
    githubUserRepositoryMock = MockGithubUserRepository();
    getGithubUsersUseCase = GetGithubUsersUseCase(
      githubUserRepository: githubUserRepositoryMock,
    );
    usersBloc = UsersBloc(
      getGithubUsersUseCase: getGithubUsersUseCase,
    );
  });

  blocTest<UsersBloc, UsersState>(
    'Given that need the github user '
    'When call [GetUsersEvent] '
    'Then return [UsersDoneState] ',
    build: () {
      when(githubUserRepositoryMock.getUsers()).thenAnswer((_) async => []);

      return usersBloc;
    },
    act: (bloc) => [
      bloc.add(const GetUsersEvent()),
    ],
    expect: () => [
      isA<UsersLoadingState>(),
      isA<UsersDoneState>(),
    ],
  );

  blocTest<UsersBloc, UsersState>(
    'Given that need the github user '
    'When call [GetUsersEvent] '
    'Then return [UsersErrorState] ',
    build: () {
      when(githubUserRepositoryMock.getUsers()).thenThrow(Exception());

      return usersBloc;
    },
    act: (bloc) => [
      bloc.add(const GetUsersEvent()),
    ],
    expect: () => [
      isA<UsersLoadingState>(),
      isA<UsersErrorState>(),
    ],
  );
}
