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
  void setAddTransactionMode() {
    pageMode = TransactionMode.create;
  }

  @action
  void setViewTransactionMode() {
    pageMode = TransactionMode.view;
  }
}
