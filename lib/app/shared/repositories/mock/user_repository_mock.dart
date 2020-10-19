import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/repositories/mock/mock_models.dart';

import '../abstract/user_repository_abstract.dart';

class UserRepositoryMock implements UserRepositoryAbstract {
  int _userIdCount = 2;
  final _duration = Duration(milliseconds: 100);

  @override
  void dispose() {}

  @override
  Future<bool> createUser(
      String username, String password, String displayName) {
    final UserModel u = UserModel(
      id: _userIdCount++,
      login: username,
      name: displayName,
      password: password,
    );
    userMockList.add(u);

    return Future.delayed(_duration).then((value) => true);
  }

  @override
  Future<bool> deleteUser(int id) {
    // final u = userMockList.firstWhere((e) => e.id == id,
    //     orElse: () => UserModel(id: -1, login: ''));

    // if (u.id == -1) {
    //   return Future.delayed(_duration).then((value) => false);
    // }

    userMockList.removeWhere((e) => e.id == id);
    return Future.delayed(_duration).then((value) => true);
  }

  @override
  Future<Map<String, dynamic>> getUserFromDisplayName(String displayName) {
    final u = userMockList.firstWhere((e) => e.name == displayName).toJson();
    return Future.delayed(_duration).then((value) => u);
  }

  @override
  Future<Map<String, dynamic>> getUserFromId(int id) {
    final u = userMockList.firstWhere((e) => e.id == id).toJson();
    return Future.delayed(_duration).then((value) => u);
  }

  @override
  Future<Map<String, dynamic>> getUserFromUsername(String username) {
    final u = userMockList.firstWhere((e) => e.login == username).toJson();
    return Future.delayed(_duration).then((value) => u);
  }

  @override
  Future<bool> updateUserDisplayName(int id, String newDisplayName) {
    UserModel u = userMockList.firstWhere((e) => e.id == id);
    int i = userMockList.indexOf(u);

    u.name = newDisplayName;
    userMockList[i] = u;

    return Future.delayed(_duration).then((value) => true);
  }

  @override
  Future<bool> updateUserPassword(int id, String newPassword) {
    UserModel u = userMockList.firstWhere((e) => e.id == id);
    int i = userMockList.indexOf(u);

    u.password = newPassword;
    userMockList[i] = u;

    return Future.delayed(_duration).then((value) => true);
  }

  @override
  Future<bool> updateUserUsername(int id, String login) {
    UserModel u = userMockList.firstWhere((e) => e.id == id);
    int i = userMockList.indexOf(u);

    final newUser = u.copyWith(login: login);
    userMockList[i] = newUser;

    return Future.delayed(_duration).then((value) => true);
  }
}
