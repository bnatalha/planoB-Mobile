import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';

import '../../../shared/repositories/transaction/transaction_repository_interface.dart';
part 'transaction_store.g.dart';

class TransactionStore = _TransactionStoreBase with _$TransactionStore;

abstract class _TransactionStoreBase with Store {
  final ITransactionRepository _transactionRepository;
  @observable
  TransactionModel transaction = TransactionModel();

  _TransactionStoreBase(this._transactionRepository);

  @action
  updateTransaction(TransactionModel model){
    transaction = model;
    _transactionRepository.updateTransaction(model);
  }

}
