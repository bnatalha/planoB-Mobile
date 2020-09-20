// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionDetailsController
    on _TransacionDetailsControllerBase, Store {
  Computed<int> _$transactionsCountComputed;

  @override
  int get transactionsCount => (_$transactionsCountComputed ??= Computed<int>(
          () => super.transactionsCount,
          name: '_TransacionDetailsControllerBase.transactionsCount'))
      .value;

  final _$transactionsAtom =
      Atom(name: '_TransacionDetailsControllerBase.transactions');

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

  final _$_TransacionDetailsControllerBaseActionController =
      ActionController(name: '_TransacionDetailsControllerBase');

  @override
  dynamic fetchTransactions() {
    final _$actionInfo =
        _$_TransacionDetailsControllerBaseActionController.startAction(
            name: '_TransacionDetailsControllerBase.fetchTransactions');
    try {
      return super.fetchTransactions();
    } finally {
      _$_TransacionDetailsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String addTransaction(TransactionModel model) {
    final _$actionInfo = _$_TransacionDetailsControllerBaseActionController
        .startAction(name: '_TransacionDetailsControllerBase.addTransaction');
    try {
      return super.addTransaction(model);
    } finally {
      _$_TransacionDetailsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
transactionsCount: ${transactionsCount}
    ''';
  }
}
