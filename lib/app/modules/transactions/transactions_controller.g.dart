// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsController on _TransactionsControllerBase, Store {
  Computed<int> _$transactionsLengthComputed;

  @override
  int get transactionsLength => (_$transactionsLengthComputed ??= Computed<int>(
          () => super.transactionsLength,
          name: '_TransactionsControllerBase.transactionsLength'))
      .value;

  final _$isLoadingAtom = Atom(name: '_TransactionsControllerBase.isLoading');

  @override
  Observable<bool> get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(Observable<bool> value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_TransactionsControllerBase.hasError');

  @override
  Observable<bool> get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(Observable<bool> value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$transactionsAtom =
      Atom(name: '_TransactionsControllerBase.transactions');

  @override
  ObservableList<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$fetchTransactionsAsyncAction =
      AsyncAction('_TransactionsControllerBase.fetchTransactions');

  @override
  Future<void> fetchTransactions() {
    return _$fetchTransactionsAsyncAction.run(() => super.fetchTransactions());
  }

  final _$_TransactionsControllerBaseActionController =
      ActionController(name: '_TransactionsControllerBase');

  @override
  dynamic selectTransaction(TransactionModel model) {
    final _$actionInfo = _$_TransactionsControllerBaseActionController
        .startAction(name: '_TransactionsControllerBase.selectTransaction');
    try {
      return super.selectTransaction(model);
    } finally {
      _$_TransactionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAddTransactionMode() {
    final _$actionInfo = _$_TransactionsControllerBaseActionController
        .startAction(name: '_TransactionsControllerBase.setAddTransactionMode');
    try {
      return super.setAddTransactionMode();
    } finally {
      _$_TransactionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeTransaction(TransactionModel model) {
    final _$actionInfo = _$_TransactionsControllerBaseActionController
        .startAction(name: '_TransactionsControllerBase.removeTransaction');
    try {
      return super.removeTransaction(model);
    } finally {
      _$_TransactionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
transactions: ${transactions},
transactionsLength: ${transactionsLength}
    ''';
  }
}
