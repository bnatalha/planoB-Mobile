import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/services/transaction_service.dart';

part 'transaction_details_controller.g.dart';

class TransactionDetailsController = _TransacionDetailsControllerBase
    with _$TransactionDetailsController;

abstract class _TransacionDetailsControllerBase with Store {
  final TransactionService _transactionService =
      Modular.get<TransactionService>();
  final TransactionStore _transactionStore;

  @observable
  bool editMode;

  @observable
  bool addTransactionMode;

  @action
  verifyMode() {
    addTransactionMode = _transactionStore.isAddingNewTransaction;
    if (addTransactionMode) {
      editMode = true;
    }
  }

  @action
  toggleEditMode() {
    editMode = !editMode;
  }

  // _TransacionDetailsControllerBase(
  //     this._transactionRepository, this._transactionStore) {
  //   enableEdit = false;
  // }

  _TransacionDetailsControllerBase(this._transactionStore) {
    editMode = false;
  }

  // TODO: corrigir
  @action
  addTransaction(TransactionModel model) {
    _transactionStore.transaction = model;
    _transactionService.addTransaction(
      userId: int.parse(model.user.name),
      toUserId: 123123,
      accountId: 2,
      value: model.value,
      description: model.description,
      tags: ['tag1, tag2'],
      category: model.category,
    );
  }

  @computed
  TransactionModel get transaction => _transactionStore.transaction;

  // TODO: corrigir
  // @action
  set transaction(TransactionModel model) {
    _transactionStore.transaction = model;
    _transactionService.updateTransaction(
      userId: int.parse(model.user.name),
      toUserId: 123123,
      accountId: 2,
      value: model.value,
      description: model.description,
      tags: ['tag1, tag2'],
      category: model.category,
    );
  }
}
