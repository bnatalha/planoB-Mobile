import 'package:plano_b/app/shared/models/user_model.dart';

class AccountModel {
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
      user: json['user'] as UserModel,
      name: json['name'] as String,
      balance: json['balance'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user': user,
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
}
