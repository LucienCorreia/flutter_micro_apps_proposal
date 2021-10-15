import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProviderStore extends ChangeNotifier implements Disposable {
 final GetGithubUsersUseCase _getGithubUsersUseCase;

  final _users = <GithubUserEntity>[];
  
  Exception? _error;
  bool _loading = true;

  List<GithubUserEntity> get users => _users;
  Exception? get error => _error;
  bool get loading => _loading;

  ProviderStore({
    required GetGithubUsersUseCase getGithubUsersUseCase
  }) : _getGithubUsersUseCase = getGithubUsersUseCase {
    _init();
  }

  Future<void> _init() async {
    try {
      _users.addAll(await _getGithubUsersUseCase());
    } catch (e) {
      _error = Exception('API error!');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
