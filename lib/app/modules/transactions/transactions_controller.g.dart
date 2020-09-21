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
  Computed<String> _$firstNameComputed;

  @override
  String get firstName =>
      (_$firstNameComputed ??= Computed<String>(() => super.firstName,
              name: '_TransactionsControllerBase.firstName'))
          .value;
  Computed<String> _$lastNameComputed;

  @override
  String get lastName =>
      (_$lastNameComputed ??= Computed<String>(() => super.lastName,
              name: '_TransactionsControllerBase.lastName'))
          .value;

  final _$transactionsAtom =
      Atom(name: '_TransactionsControllerBase.transactions');

  @override
  ObservableFuture<List<TransactionModel>> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableFuture<List<TransactionModel>> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
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
  dynamic fetchTransactions() {
    final _$actionInfo = _$_TransactionsControllerBaseActionController
        .startAction(name: '_TransactionsControllerBase.fetchTransactions');
    try {
      return super.fetchTransactions();
    } finally {
      _$_TransactionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
transactionsLength: ${transactionsLength},
firstName: ${firstName},
lastName: ${lastName}
    ''';
  }
}
