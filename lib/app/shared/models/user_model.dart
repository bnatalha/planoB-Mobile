import 'package:flutter/foundation.dart';
// import 'package:equatable/equatable.dart';

class UserModel {
  UserModel({
    this.id,
    @required this.login,
    this.name,
    this.password,
  });

  int id;
  final String login;
  String name;
  String password;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      login: json['login'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'login': login,
      'name': name,
      'password': password,
    };
  }

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
    int id,
    String login,
    String name,
    String password,
  }) {
    return UserModel(
      id: id ?? this.id,
      login: login ?? this.login,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}
