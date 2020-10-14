import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/services/transaction_service.dart';

part 'transactions_controller.g.dart';

class TransactionsController = _TransactionsControllerBase
    with _$TransactionsController;

abstract class _TransactionsControllerBase with Store {
  // final ISessionRepository _sessionRepository;
  final TransactionService _transactionService =
      Modular.get<TransactionService>();
  final TransactionStore _transactionStore;

  @observable
  ObservableFuture<List<TransactionModel>> transactions;

  @computed
  int get transactionsLength => transactions.value.length;

  // _TransactionsControllerBase(
  //     this._sessionRepository, this._transactionRepository, this._transactionStore) {
  //   fetchTransactions();
  // }

  // _TransactionsControllerBase(this._sessionRepository, this._transactionStore) {
  _TransactionsControllerBase(this._transactionStore) {
    fetchTransactions();
  }

  @action
  selectTransaction(TransactionModel model) {
    _transactionStore.transaction = model;
    _transactionStore.setViewTransactionMode();
  }

  @action
  setAddTransactionMode() {
    _transactionStore.transaction = TransactionModel();
    _transactionStore.setAddTransactionMode();
  }

  @action
  removeTransaction(TransactionModel model) {
    _transactionService.removeTransaction(transactionId: model.id);
    // fetchTransactions();
    // transactions =
    //     _transactionRepository.fetchTransactionsForCurrentUser().asObservable();
  }

  @action
  fetchTransactions() {
    transactions =
        _transactionService.getTransactionsFromAccount().asObservable();
  }

  // @computed
  // String get firstName => _sessionRepository.currentLoggedUser.name;

  // @computed
  // String get lastName => _sessionRepository.currentLoggedUser.name;
}
