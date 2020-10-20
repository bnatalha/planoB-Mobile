import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';
import 'package:plano_b/app/shared/utils/box_names.dart';

import '../abstract/user_repository_abstract.dart';

class UserRepositoryHive implements UserRepositoryAbstract {
  Box<String> hive;

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
      login: username,
      password: password,
      name: displayName,
    );

    print('Created user with info: ${user.id}, ${user.login}, ${user.name}');

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
  Future<Map<String,dynamic>> getUserFromDisplayName(String displayName) {
    // TODO: implement getUserFromDisplayName
    throw UnimplementedError();
  }

  @override
  Future<Map<String,dynamic>> getUserFromId(int id) async {
    Map<String, dynamic> user = jsonDecode(hive.get(id));
    print(user);
    return user;
  }

  @override
  Future<Map<String,dynamic>> getUserFromUsername(String username) async {
    return jsonDecode(hive.get(username.hashCode));

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
        login: model.login,
        password: model.password,
        name: newDisplayName,
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
        login: model.name,
        password: newPassword,
        name: model.name,
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
    try {
      hive.values.toList().map((value) => print(value));

      final UserModel userModel =
          UserModel.fromJson(jsonDecode(hive.get(username.hashCode)));

      print('UserModel authenticated: ' + userModel.toJson().toString());
      final LoggedUserStore store = Modular.get<LoggedUserStore>();
      store.setCurrentUser(userModel);

      if (userModel != null &&
          userModel.login == username &&
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
