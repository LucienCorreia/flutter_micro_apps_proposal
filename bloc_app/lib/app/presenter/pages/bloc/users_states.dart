import 'package:core/app/domain/domain.dart';

abstract class UsersState {
   const UsersState();
}

class UsersLoadingState extends UsersState {
  const UsersLoadingState();
}

class UsersDoneState extends UsersState {
  final List<GithubUserEntity> users;

  const UsersDoneState(this.users);
}

class UsersErrorState extends UsersState {
  const UsersErrorState();
}
