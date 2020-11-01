import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
// import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    int id,
    @required this.login,
    this.name,
    this.password,
  }) : id = id ?? '$login,$name,$password'.hashCode;

  final int id;
  final String login;
  final String name;
  final String password;

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

  // /// Will only update password if is a match
  // Future<bool> updatePass({
  //   @required String oldPass,
  //   @required String newPass,
  // }) async {
  //   if (oldPass == password) {
  //     password = newPass;
  //     return true;
  //   }
  //   return false;
  // }

  UserModel copyWith({
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

  @override
  List<Object> get props => [id, login, name, password];
}
