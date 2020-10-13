import 'package:plano_b/app/shared/models/user_model.dart';

import 'model.dart';

class AccountModel implements Model {
  final UserModel user;
  final String name;
  final double balance;

  const AccountModel({
    this.user,
    this.name,
    this.balance,
  });

  AccountModel copyWith({
    UserModel user,
    String name,
    double balance,
  }) {
    return AccountModel(
      user: user ?? this.user,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }

  @override
  AccountModel.fromJson(Map<String, dynamic> json)
      : user = UserModel.fromJson(json['user']),
        name = json['name'],
        balance = json['balance'];

  @override
  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'name': name,
        'balance': balance,
      };
}
