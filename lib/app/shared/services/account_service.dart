import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/account_repository_abstract.dart';

class AccountService {
  final AccountRepositoryAbstract accountRepository;

  AccountService({@required this.accountRepository})
      : assert(accountRepository != null);

  Future<AccountModel> createAccount({int userId, String bankName}) {}

  Future<bool> deleteAccount({int accountId}) {}

  Future<List<AccountModel>> getAccountsOfUser({int userId}) {}

  Future<AccountModel> getAccount({int accountId}) {}
}
