import 'package:hive/hive.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/utils/box_names.dart';

import '../abstract/user_repository_abstract.dart';

class UserRepositoryHive implements UserRepositoryAbstract {
  Box hive;

  UserRepositoryHive() {
    _initBox();
  }

  Future<void> _initBox() async {
    // hive = Hive.box(BoxNames.userRepositoryBoxName);
    hive = BoxNames.userRepositoryBox;
    Hive.registerAdapter(UserModelAdapter());
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<bool> createUser(
    String username,
    String password,
    String displayName,
  ) {
    // UserModel userRetrieved = hive.get(username.hashCode);
    // print(userRetrieved);

    final UserModel user = UserModel(
      id: username.hashCode,
      username: username,
      password: password,
      displayName: displayName,
    );

    hive.put(username.hashCode, user);
    print(hive.keys.toList());
    print(hive.values.toList());
  }

  @override
  Future<bool> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserFromDisplayName(String displayName) {
    // TODO: implement getUserFromDisplayName
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserFromId(int id) {
    // TODO: implement getUserFromId
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserFromUsername(String username) {
    // TODO: implement getUserFromUsername
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserDisplayName(int id, String newDisplayName) {
    // TODO: implement updateUserDisplayName
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserPassword(int id, String newPassword) {
    // TODO: implement updateUserPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserUsername(int id, String newUsername) {
    // TODO: implement updateUserUsername
    throw UnimplementedError();
  }
}
