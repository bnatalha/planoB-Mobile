import 'package:flutter/foundation.dart';
// import 'package:equatable/equatable.dart';

class UserModel {
  UserModel({
    @required this.username,
    this.firstName,
    this.lastName,
    this.password,
  });

  final String username;
  String firstName;
  String lastName;
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
