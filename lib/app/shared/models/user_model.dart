import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'model.dart';

part 'user_model.g.dart';

@HiveType(adapterName: 'UserModel', typeId: 1)
class UserModel implements Model {
  UserModel({
    @required this.login,
    this.name,
    this.password,
  });

  @override
  UserModel.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        name = json['name'],
        password = json['password'];

  @override
  Map<String, dynamic> toJson() => {
        'login': login,
        'name': name,
        'password': password,
      };

  @HiveField(0)
  final String login;

  @HiveField(1)
  String password;

  @HiveField(2)
  String name;

  /// Will only update password if is a match
  Future<bool> updatePass({
    @required String oldPass,
    @required String newPass,
  }) async {
    if (oldPass == password) {
      password = newPass;
      return true;
    }
    return false;
  }

  copyWith({
    String login,
    String name,
    String password,
  }) {
    return UserModel(
      login: login ?? this.login,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}
