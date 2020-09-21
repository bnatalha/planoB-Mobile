import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';

abstract class ITransactionRepository extends Disposable {
  Future<List<TransactionModel>> fetchTransactionsForCurrentUser();

  Future<String> addTransaction(TransactionModel model);

  Future<String> updateTransaction(TransactionModel model);
}
