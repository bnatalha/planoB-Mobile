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
}
