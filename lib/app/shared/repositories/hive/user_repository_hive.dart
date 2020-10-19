import 'dart:convert';

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
    hive = Boxes.boxes[Boxes.userRepositoryBoxName];
  }

  @override
  void dispose() {
    hive.close();
  }

  @override
  Future<bool> createUser(
    String username,
    String password,
    String displayName,
  ) async {
    final UserModel user = UserModel(
      id: username.hashCode,
      username: username,
      password: password,
      displayName: displayName,
    );

    hive.put(user.id, jsonEncode(user.toJson()));
    return true;
  }

  @override
  Future<bool> deleteUser(int id) {
    final String jsonString = hive.get(id);
    if (jsonString != null) {
      hive.delete(id);
    }
  }

  @override
  Future<UserModel> getUserFromDisplayName(String displayName) {
    // TODO: implement getUserFromId
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserFromId(int id) async {
    return UserModel.fromJson(jsonDecode(hive.get(id)));
  }

  @override
  Future<UserModel> getUserFromUsername(String username) async {
    return UserModel.fromJson(jsonDecode(hive.get(username.hashCode)));
  }

  @override
  Future<bool> updateUserDisplayName(int id, String newDisplayName) async {
    try {
      UserModel model = UserModel.fromJson(jsonDecode(hive.get(id)));

      if (model == null) {
        return false;
      }

      final UserModel newModel = UserModel(
        id: model.id,
        username: model.username,
        password: model.password,
        displayName: newDisplayName,
      );

      hive.put(model.id, jsonEncode(newModel.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateUserPassword(int id, String newPassword) async {
    try {
      final UserModel model = UserModel.fromJson(jsonDecode(hive.get(id)));
      final UserModel newModel = UserModel(
        id: model.id,
        username: model.username,
        password: newPassword,
        displayName: model.displayName,
      );

      hive.put(model.id, jsonEncode(newModel.toJson()));

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateUserUsername(int id, String newUsername) {
    // TODO: implement updateUserUsername
    throw UnimplementedError();
  }

  @override
  Future<bool> authenticateUser(String username, String password) async {
    print('Tentando autenticar:');
    try {
      hive.values.toList().map((value) => print(value));

      final UserModel userModel =
          UserModel.fromJson(jsonDecode(hive.get(username.hashCode)));

      if (userModel != null &&
          userModel.username == username &&
          userModel.password == userModel.password) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
