import 'package:plano_b/app/shared/models/user_model.dart';

class AccountModel {
  final UserModel user;
  final String name;
  final double balance;

  AccountModel({
    this.user,
    this.name,
    this.balance,
  });

  copyWith({
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
}
