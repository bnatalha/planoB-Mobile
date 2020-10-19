import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/account_repository_abstract.dart';

class AccountService {
  final AccountRepositoryAbstract accountRepository;

  AccountService({@required this.accountRepository})
      : assert(accountRepository != null);

  Future<bool> createAccount({int userId, String bankName}) async {
    return await accountRepository.createAccount(userId, bankName);
  }

  Future<bool> deleteAccount({int accountId}) async {
    return await accountRepository.deleteAccount(accountId);
  }

  Future<List<AccountModel>> getAccountsOfUser({int userId}) async {
    final jsonList = await accountRepository.getAccountsFromUserId(userId);
    return jsonList.map((e) => AccountModel.fromJson(e)).toList();
  }

  Future<AccountModel> getAccount({int accountId}) async {
    final json = await accountRepository.getAccountFromId(accountId);
    return AccountModel.fromJson(json);

  }
}
