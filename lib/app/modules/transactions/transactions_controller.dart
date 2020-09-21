import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/session/session_repository_interface.dart';
import 'package:plano_b/app/shared/repositories/transaction/transaction_repository_interface.dart';

part 'transactions_controller.g.dart';

class TransactionsController = _TransactionsControllerBase
    with _$TransactionsController;

abstract class _TransactionsControllerBase with Store {
  final ISessionRepository _sessionRepository;
  final ITransactionRepository _transactionRepository =
      Modular.get<ITransactionRepository>();
  final TransactionStore _transactionStore;

  @observable
  ObservableFuture<List<TransactionModel>> transactions;

  @computed
  int get transactionsLength => transactions.value.length;

  // _TransactionsControllerBase(
  //     this._sessionRepository, this._transactionRepository, this._transactionStore) {
  //   fetchTransactions();
  // }

  _TransactionsControllerBase(this._sessionRepository, this._transactionStore) {
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
    _transactionRepository.removeTransaction(model);
    // fetchTransactions();
    // transactions =
    //     _transactionRepository.fetchTransactionsForCurrentUser().asObservable();
  }

  @action
  fetchTransactions() {
    transactions =
        _transactionRepository.fetchTransactionsForCurrentUser().asObservable();
  }

  @computed
  String get firstName => _sessionRepository.currentLoggedUser.name;

  @computed
  String get lastName => _sessionRepository.currentLoggedUser.name;
}
