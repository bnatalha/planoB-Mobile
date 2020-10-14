import 'package:plano_b/app/shared/models/account_model.dart';

import '../abstract/account_repository_abstract.dart';

class AccountRepositoryHive implements AccountRepositoryAbstract {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<bool> createAccount(int userId, String bankName) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAccount(int id) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<AccountModel> getAccountFromId(int id) {
    // TODO: implement getAccountFromId
    throw UnimplementedError();
  }

  @override
  Future<List<AccountModel>> getAccountsFromUserId(int userId) {
    // TODO: implement getAccountsFromUserId
    throw UnimplementedError();
  }

  @override
  Future<bool> updateAccountBankName(int id, String newBankName) {
    // TODO: implement updateAccountBankName
    throw UnimplementedError();
  }
}
