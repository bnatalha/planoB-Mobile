import 'package:hive/hive.dart';

import 'model.dart';

class UserModel extends Model with HiveObject {
  final int id;

  final String username;

  final String password;

  final String displayName;

  UserModel({
    this.id,
    this.username,
    this.password,
    this.displayName,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        password = json['password'],
        displayName = json['displayName'];

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'displayName': displayName,
      };

  @override
  String toString() {
    return '($id, $username)';
  }
}
