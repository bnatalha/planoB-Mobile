import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
// import 'package:plano_b/app/shared/models/transaction_model.dart';

import '../repository.dart';

abstract class TransactionRepositoryAbstract extends Repository {

  /// Get transaction that [transaction.id] == [id]
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
    UserModel user,
    AccountModel source,
    AccountModel destination,
    double value,
    String description,
    DateTime date,
    // List<String> tags,
    CategoryModel category,
  });

  Future<bool> updateTransaction({
    @required int id,
    UserModel user,
    AccountModel source,
    AccountModel destination,
    double value,
    String description,
    DateTime date,
    // List<String> tags,
    CategoryModel category,
  });

  Future<bool> removeTransaction({int transactionId});
}
