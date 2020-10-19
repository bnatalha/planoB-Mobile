import 'package:plano_b/app/shared/models/user_model.dart';

import '../repository.dart';

abstract class UserRepositoryAbstract extends Repository {

  /// Fuzzy search maybe (?)
  Future<Map<String,dynamic>> getUserFromDisplayName(String displayName);

  Future<Map<String,dynamic>> getUserFromId(int id);

  Future<Map<String,dynamic>> getUserFromUsername(String username);

  Future<bool> updateUserPassword(int id, String newPassword);

  Future<bool> updateUserDisplayName(int id, String newDisplayName);

  Future<bool> updateUserUsername(int id, String newUsername);

  Future<bool> deleteUser(int id);

  Future<bool> createUser(String username, String password, String displayName);

  Future<bool> authenticateUser(String username, String password);
}
