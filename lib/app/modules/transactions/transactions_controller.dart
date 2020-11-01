import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/transaction_repository_abstract.dart';
// import 'package:plano_b/app/shared/repositories/session/session_repository_interface.dart';
// import 'package:plano_b/app/shared/repositories/transaction/transaction_repository_interface.dart';
import 'package:plano_b/app/shared/services/transaction_service.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';

part 'transactions_controller.g.dart';

class TransactionsController = _TransactionsControllerBase
    with _$TransactionsController;

abstract class _TransactionsControllerBase with Store {
  // final ISessionRepository _sessionRepository;
  final TransactionService _transactionService =
      Modular.get<TransactionService>();
  final TransactionStore _transactionStore;

  final LoggedUserStore _loggedUserStore = Modular.get();

  @observable
  Observable<bool> isLoading = Observable(false);

  @observable
  Observable<bool> hasError = Observable(false);

  @observable
  ObservableList<TransactionModel> transactions;

  @computed
  int get transactionsLength => transactions.length;

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
  Future<void> fetchTransactions() async {
    isLoading.value = true;
    try {
      transactions = (await _transactionService.getTransactionsFromUser(
              userId: _loggedUserStore.currentUser.value.id))
          ?.asObservable() ?? <TransactionModel>[].asObservable();

      dev.log('transactions:', name: 'fetchTransactions', error: transactions);
      hasError.value = false;
    } catch (e) {
      dev.log('error', name: 'fetchTransactions', error: e);

      hasError.value = true;
    }
    isLoading.value = false;
  }

  // @computed
  // String get firstName => _sessionRepository.currentLoggedUser.name;

  // @computed
  // String get lastName => _sessionRepository.currentLoggedUser.name;
}
