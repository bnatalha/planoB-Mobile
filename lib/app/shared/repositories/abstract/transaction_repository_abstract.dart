import 'package:plano_b/app/shared/models/category_model.dart';
// import 'package:plano_b/app/shared/models/transaction_model.dart';

import '../repository.dart';

abstract class TransactionRepositoryAbstract extends Repository {
  Future<Map<String,dynamic>> getTransactionFromId(int id);

  Future<List<Map<String,dynamic>>> getTransactionsFromAccountId(int accountId);

  Future<List<Map<String,dynamic>>> getTransactionsFromAccountWithTag(
    int accountId,
    String tag,
  );

  Future<List<Map<String,dynamic>>> getTransactionsFromAccountWithCategory(
    int accountId,
    CategoryModel category,
  );

  Future<bool> addTransaction({
    int userId,
    int toUserId,
    int accountId,
    double value,
    String description,
    List<String> tags,
    CategoryModel category,
  });

  Future<bool> removeTransaction({int transactionId});
}
