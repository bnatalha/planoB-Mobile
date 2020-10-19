// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionStore on _TransactionStoreBase, Store {
  final _$transactionAtom = Atom(name: '_TransactionStoreBase.transaction');

  @override
  TransactionModel get transaction {
    _$transactionAtom.reportRead();
    return super.transaction;
  }

  @override
  set transaction(TransactionModel value) {
    _$transactionAtom.reportWrite(value, super.transaction, () {
      super.transaction = value;
    });
  }

  final _$pageModeAtom = Atom(name: '_TransactionStoreBase.pageMode');

  @override
  TransactionMode get pageMode {
    _$pageModeAtom.reportRead();
    return super.pageMode;
  }

  @override
  set pageMode(TransactionMode value) {
    _$pageModeAtom.reportWrite(value, super.pageMode, () {
      super.pageMode = value;
    });
  }

  final _$_TransactionStoreBaseActionController =
      ActionController(name: '_TransactionStoreBase');

  @override
  dynamic setAddTransactionMode() {
    final _$actionInfo = _$_TransactionStoreBaseActionController.startAction(
        name: '_TransactionStoreBase.setAddTransactionMode');
    try {
      return super.setAddTransactionMode();
    } finally {
      _$_TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transaction: ${transaction},
pageMode: ${pageMode}
    ''';
  }
}
