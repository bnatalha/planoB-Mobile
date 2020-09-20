import 'package:flutter/foundation.dart';

import '../../models/user_model.dart';
import 'user_repository_interface.dart';

class UserRepositoryMock implements IUserRepository {
  final Map<String, UserModel> users = <String, UserModel>{
    'admin': UserModel(login: 'admin', password: 'admin'), // Default user
  };

  // Dispose will be called automatically
  @override
  void dispose() {}

  Future<bool> addUser({
    @required String username,
    @required String password,
  }) async {
    if (users.containsKey(username)) {
      users[username] = UserModel(login: username, password: password);
      return true;
    } else {
      // Username already taken
      return false;
    }
  }

  Future<bool> removeUser({
    @required String username,
  }) async {
    try {
      users.remove(username);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changeUserFirstName({
    @required String username,
    @required String toName,
  }) async {
    if (users.containsKey(username) && toName.isNotEmpty) {
      users[username].name = toName;
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> changeUserLastName({
  //   @required String username,
  //   @required String toName,
  // }) async {
  //   if (users.containsKey(username) && toName.isNotEmpty) {
  //     users[username].lastName = toName;
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<bool> changeUserPassword({
    @required String username,
    @required String toPassword,
  }) async {
    if (users.containsKey(username) && toPassword.isNotEmpty) {
      users[username].password = toPassword;
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel> getUser({@required String username}) async {
    return users[username];
  }

  Future<bool> authUser({
    @required String username,
    @required String password,
  }) async {
    if (users.containsKey(username)) {
      return users[username].password == password;
    }
    return false;
  }
}
