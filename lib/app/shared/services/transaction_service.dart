import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/repositories/abstract/transaction_repository_abstract.dart';

class TransactionService {
  const TransactionService({@required this.transactionRepository});

  final TransactionRepositoryAbstract transactionRepository;
}
