import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStoreBase with _$TransactionStore;

abstract class _TransactionStoreBase with Store {
  @observable
  TransactionModel transaction = TransactionModel();

  @observable
  bool isAddingNewTransaction = false;

  @action
  setAddTransactionMode() {
    isAddingNewTransaction = true;
  }

  setViewTransactionMode() {
    isAddingNewTransaction = false;
  }

  // @action
  // updateTransaction(TransactionModel model){
  //   transaction = model;
  //   _transactionRepository.updateTransaction(model);
  // }

}
