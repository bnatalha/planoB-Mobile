import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/transaction_repository_abstract.dart';

class TransactionService {
  const TransactionService({@required this.transactionRepository});

  final TransactionRepositoryAbstract transactionRepository;

  Future<List<TransactionModel>> getTransactionsFromAccount({int accountId}) {}

  Future<bool> addTransaction({
    int userId,
    int toUserId,
    int accountId,
    double value,
    String description,
    List<String> tags,
    CategoryModel category,
  }) async {}

  Future<bool> removeTransaction({int transactionId}) async {}
}
