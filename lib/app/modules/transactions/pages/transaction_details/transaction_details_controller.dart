import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/transaction_repository_abstract.dart';

part 'transaction_details_controller.g.dart';

class TransactionDetailsController = _TransacionDetailsControllerBase
    with _$TransactionDetailsController;

abstract class _TransacionDetailsControllerBase with Store {
  final TransactionRepositoryAbstract transactionService =
      Modular.get<TransactionRepositoryAbstract>();
  final TransactionStore _transactionStore;

  @observable
  bool editMode;

  @observable
  bool addTransactionMode;

  @action
  verifyMode(){
    addTransactionMode = _transactionStore.isAddingNewTransaction;
    if(addTransactionMode) {
      editMode = true;
    }
  }

  @action
  toggleEditMode() {
    editMode = !editMode;
  }

  _TransacionDetailsControllerBase(this._transactionStore) {
    editMode = false;
  }

  @action
  addTransaction(TransactionModel model) {
    _transactionStore.transaction = model;
    // TODO: Add logic to proper add transaction
    // transactionService.addTransaction();
  }
  

  @computed
  TransactionModel get transaction => _transactionStore.transaction;

  set transaction(TransactionModel model) {
    _transactionStore.transaction = model;
    // TODO: Add logic to proper update transaction
    // transactionService.updateTransaction(model);
  }
}
