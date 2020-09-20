import 'package:flutter/foundation.dart';
// import 'package:equatable/equatable.dart';

class UserModel {
  UserModel({
    @required this.login,
    this.name,
    // this.lastName,
    this.password,
  });

  final String login;
  // String firstName;
  String name;
  // String lastName;
  String password;

  /// Will only update password if is a match
  Future<bool> updatePass({
    @required String oldPass,
    @required String newPass,
    }) async {
    if(oldPass == password) {
      password = newPass;
      return true;
    }
    return false;
  }
}
