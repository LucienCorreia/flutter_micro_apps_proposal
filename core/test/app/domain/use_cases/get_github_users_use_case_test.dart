import 'package:core/app/domain/domain.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_github_users_use_case_test.mocks.dart';

abstract class GithubUserRepository extends Mock
    implements IGithubUserRepository {}

@GenerateMocks([
  GithubUserRepository,
])
void main() {
  late MockGithubUserRepository githubUserRepositoryMock;
  late GetGithubUsersUseCase getGithubUsersUseCase;

  setUp(() {
    githubUserRepositoryMock = MockGithubUserRepository();
    getGithubUsersUseCase = GetGithubUsersUseCase(
      githubUserRepository: githubUserRepositoryMock,
    );
  });
  group('GetGithubUsersUseCase', () {
    test(
        'Given that need the github user '
        'When call [getGithubUsersUserCase] '
        'Then return a list of [GithubUserEntity] ', () async {
      when(githubUserRepositoryMock.getUsers())
          .thenAnswer((_) async => <GithubUserEntity>[]);

      final users = await getGithubUsersUseCase();

      expect(users, isA<List<GithubUserEntity>>());
      expect(users.length, equals(0));
      verify(githubUserRepositoryMock.getUsers()).called(1);
    });

    test(
        'Given that need the github user '
        'When call [getGithubUsersUserCase] '
        'Then throw exception ', () async {
      when(githubUserRepositoryMock.getUsers()).thenThrow(
        DioError(
          requestOptions: RequestOptions(path: ''),
          error: DioErrorType.other,
          response: Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
          ),
        ),
      );

      final users = getGithubUsersUseCase;

      expect(() async => await users(), throwsA(isA<DioError>()));
      expect(
        () async => await users(),
        throwsA(
          predicate((e) => e is DioError && e.response!.statusCode == 500),
        ),
      );
      verify(githubUserRepositoryMock.getUsers()).called(2);
    });
  });
}
