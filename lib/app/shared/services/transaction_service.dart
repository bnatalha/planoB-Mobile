import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/transaction_repository_abstract.dart';

class TransactionService {
  const TransactionService({@required this.transactionRepository});

  final TransactionRepositoryAbstract transactionRepository;

  Future<List<TransactionModel>> getTransactionsFromAccount({
    int accountId,
  }) async {
    final List<Map<String, dynamic>> rawTransactions =
        await transactionRepository.getTransactionsFromAccountId(accountId);

    final List<TransactionModel> transactions = rawTransactions.map(
      (Map<String, dynamic> transaction) =>
          TransactionModel.fromJson(transaction),
    );

    return transactions;
  }

  Future<bool> addTransaction({
    int userId,
    int toUserId,
    int accountId,
    double value,
    String description,
    List<String> tags,
    CategoryModel category,
  }) async {
    return transactionRepository.addTransaction(
      userId: userId,
      toUserId: toUserId,
      accountId: accountId,
      value: value,
      description: description,
      tags: tags,
      category: category,
    );
  }

  Future<bool> removeTransaction({int transactionId}) async {
    return transactionRepository.removeTransaction(transactionId: transactionId);
  }

  Future<bool> updateTransaction({
    int userId,
    int toUserId,
    int accountId,
    double value,
    String description,
    List<String> tags,
    CategoryModel category,
  }) async {
    throw UnimplementedError();
  }
}
