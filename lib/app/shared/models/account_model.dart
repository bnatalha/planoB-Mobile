import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

class AccountModel extends Equatable{
  final int id;
  final UserModel user;
  final String name;
  final double balance;

  AccountModel({
    this.id,
    this.user,
    this.name,
    this.balance,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'] as int,
      user: UserModel.fromJson(jsonDecode(json['user'])),
      name: json['name'] as String,
      balance: json['balance'] as double,
    );
  }
  
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user': jsonEncode(user.toJson()),
      'name': name,
      'balance': balance,
    };
  }

  copyWith({
    int id,
    UserModel user,
    String name,
    double balance,
  }) {
    return AccountModel(
      id: id ?? this.id,
      user: user ?? this.user,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [id,user,name,balance];
}
