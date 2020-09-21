import 'package:plano_b/app/shared/models/transaction_model.dart';

import 'transaction_repository_interface.dart';

/// Mock Version
class TransactionRepository implements ITransactionRepository {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<String> addTransaction(TransactionModel model) {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> fetchTransactionsForCurrentUser() {
    // TODO: implement fetchTransactionsForCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> updateTransaction(TransactionModel model) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
