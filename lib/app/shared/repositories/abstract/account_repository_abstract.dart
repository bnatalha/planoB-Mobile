import 'package:plano_b/app/shared/models/account_model.dart';

import '../repository.dart';

abstract class AccountRepositoryAbstract extends Repository {
  Future<AccountModel> getAccountFromId(int id);

  Future<List<AccountModel>> getAccountsFromUserId(int userId);

  Future<bool> updateAccountBankName(int id, String newBankName);

  Future<bool> createAccount(int userId, String bankName);

  Future<bool> deleteAccount(int id);
}
