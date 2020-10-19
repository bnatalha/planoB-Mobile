import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';

part 'transaction_store.g.dart';

enum TransactionMode {
  edit,
  view,
  create,
}

class TransactionStore = _TransactionStoreBase with _$TransactionStore;

abstract class _TransactionStoreBase with Store {
  @observable
  TransactionModel transaction = TransactionModel();

  @observable
  TransactionMode pageMode = TransactionMode.view;

  @action
  setAddTransactionMode() {
    pageMode = TransactionMode.create;
  }

  setViewTransactionMode() {
    pageMode = TransactionMode.view;
  }

  // @action
  // updateTransaction(TransactionModel model){
  //   transaction = model;
  //   _transactionRepository.updateTransaction(model);
  // }

}
