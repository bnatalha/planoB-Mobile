import '../repository.dart';

abstract class AccountRepositoryAbstract extends Repository {
  Future<Map<String,dynamic>> getAccountFromId(int id);

  Future<List<Map<String,dynamic>>> getAccountsFromUserId(int userId);

  Future<bool> updateAccountBankName(int id, String newBankName);

  Future<bool> updateAccountBalance(int id, double offsetBalance);

  Future<bool> createAccount(int userId, String bankName);

  Future<bool> deleteAccount(int id);
}
