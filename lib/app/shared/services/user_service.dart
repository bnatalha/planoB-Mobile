import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/user_repository_abstract.dart';

class UserService {
  const UserService({@required this.userRepository})
      : assert(userRepository != null);

  final UserRepositoryAbstract userRepository;

  /// Will return a [UserModel] if credentials matches with database, null otherwise
  Future<UserModel> login({String username, String password}) async {}

  /// Will perform a logout from the user [userId]
  Future<void> logout({int userId}) async {}

  /// Will delete the user with [userId]
  Future<bool> deleteUser({int userId}) async {}

  /// Will create a user
  Future<bool> createUser({
    String username,
    String password,
    String displayName,
  }) async {
    userRepository.createUser(username, password, displayName);
  }

  /// Will change username of the user with [userId] to [newUsername]
  Future<bool> changeUsername({int userId, String newUsername}) {}

  /// Will change password of [userId] to [newPassword]
  Future<bool> changePassword({int userId, String newPassword}) {}

  /// Will change the display name of [userId] to [newDisplayName]
  Future<bool> changeDisplayName({int userId, String newDisplayName}) {}
}
