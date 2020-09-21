import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/transaction/transaction_repository_interface.dart';

import '../../../../shared/repositories/transaction/transaction_repository_interface.dart';
part 'transaction_details_controller.g.dart';

class TransactionDetailsController = _TransacionDetailsControllerBase
    with _$TransactionDetailsController;

abstract class _TransacionDetailsControllerBase with Store {
  final ITransactionRepository _transactionRepository =
      Modular.get<ITransactionRepository>();
  final TransactionStore _transactionStore;

  @observable
  bool enableEdit;

  @action
  toggleEditMode() {
    enableEdit = !enableEdit;
  }

  // _TransacionDetailsControllerBase(
  //     this._transactionRepository, this._transactionStore) {
  //   enableEdit = false;
  // }

  _TransacionDetailsControllerBase(this._transactionStore) {
    enableEdit = false;
  }

  @computed
  TransactionModel get transaction => _transactionStore.transaction;

  set transaction(TransactionModel model) {
    _transactionStore.transaction = model;
    _transactionRepository.updateTransaction(model);
  }
}
