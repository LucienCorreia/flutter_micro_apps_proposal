import 'package:bloc_app/app/bloc_app_module.dart';
import 'package:bloc_app/app/presenter/pages/bloc/users_bloc.dart';
import 'package:bloc_app/app/presenter/pages/bloc_page.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/app/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import 'bloc_page_test.mocks.dart';

abstract class GithubUserRepository extends Mock
    implements IGithubUserRepository {}

@GenerateMocks([
  GithubUserRepository,
])
void main() {
  final githubUserRepository = MockGithubUserRepository();

  setUp(() {
    initModule(
      BlocAppModule(),
      replaceBinds: [
        Bind.factory<UsersBloc>(
          (i) => UsersBloc(
            getGithubUsersUseCase: GetGithubUsersUseCase(
              githubUserRepository: githubUserRepository,
            ),
          ),
        ),
      ],
    );
  });

  testWidgets(
    'Given that need the github user '
    'When [BlocPage] is opened with success'
    'Then show [ListView] of the [UserWidget] ',
    (WidgetTester tester) async {
      when(githubUserRepository.getUsers()).thenAnswer((_) async => []);

      await tester.pumpWidget(
        const MaterialApp(
          home: BlocPage(),
        ),
      );

      final findLoading = find.byType(CircularProgressIndicator);

      expect(findLoading, findsOneWidget);

      await tester.pump();

      final listViewFind = find.byType(ListView);

      expect(listViewFind, findsOneWidget);
    },
  );

  testWidgets(
    'Given that need the github user '
    'When [BlocPage] is opened with error'
    'Then show error message ',
    (WidgetTester tester) async {
      when(githubUserRepository.getUsers()).thenThrow(Exception());

      await tester.pumpWidget(
        const MaterialApp(
          home: BlocPage(),
        ),
      );

      final findLoading = find.byType(CircularProgressIndicator);

      expect(findLoading, findsOneWidget);

      await tester.pump();

      final errorFind = find.text('Error');

      expect(errorFind, findsOneWidget);
    },
  );
}
