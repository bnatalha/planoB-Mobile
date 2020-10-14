import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';

import '../repository.dart';

abstract class TransactionRepositoryAbstract extends Repository {
  Future<TransactionModel> getTransactionFromId(int id);

  Future<List<TransactionModel>> getTransactionsFromAccountId(int accountId);

  Future<List<TransactionModel>> getTransactionsFromAccountWithTag(
    int accountId,
    String tag,
  );

  Future<List<TransactionModel>> getTransactionsFromAccountWithCategory(
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
