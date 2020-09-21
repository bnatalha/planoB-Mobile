import 'package:flutter/foundation.dart';
// import 'package:equatable/equatable.dart';

class UserModel {
  UserModel({
    @required this.login,
    this.name,
    // this.lastName,
    this.password,
  });

  // String firstName;
  // String lastName;
  final String login;
  String name;
  String password;

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
