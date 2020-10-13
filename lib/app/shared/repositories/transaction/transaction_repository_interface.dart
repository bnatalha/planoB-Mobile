import 'package:plano_b/app/shared/models/transaction_model.dart';

import '../repository.dart';

abstract class ITransactionRepository extends Repository {
  Future<List<TransactionModel>> fetchTransactionsForCurrentUser();

  Future<String> addTransaction(TransactionModel model);

  Future<String> updateTransaction(TransactionModel model);

  Future<String> removeTransaction(TransactionModel model);
}
