import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/transaction/transaction_repository_interface.dart';
part 'transaction_details_controller.g.dart';

class TransactionDetailsController = _TransacionDetailsControllerBase
    with _$TransactionDetailsController;

abstract class _TransacionDetailsControllerBase with Store {
  final ITransactionRepository _transactionRepository;
  final TransactionStore _transactionStore;

  _TransacionDetailsControllerBase(
      this._transactionRepository, this._transactionStore);

  TransactionModel get transaction => _transactionStore.transaction;
  
}
