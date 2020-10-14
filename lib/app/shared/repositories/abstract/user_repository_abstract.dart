import 'package:plano_b/app/shared/models/user_model.dart';

import '../repository.dart';

abstract class UserRepositoryAbstract extends Repository {

  /// Fuzzy search maybe (?)
  Future<UserModel> getUserFromDisplayName(String displayName);

  Future<UserModel> getUserFromId(int id);

  Future<UserModel> getUserFromUsername(String username);

  Future<bool> updateUserPassword(int id, String newPassword);

  Future<bool> updateUserDisplayName(int id, String newDisplayName);

  Future<bool> updateUserUsername(int id, String newUsername);

  Future<bool> deleteUser(int id);

  Future<bool> createUser(String username, String password, String displayName);
}
