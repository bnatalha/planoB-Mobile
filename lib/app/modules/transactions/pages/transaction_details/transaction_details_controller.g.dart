// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionDetailsController
    on _TransacionDetailsControllerBase, Store {
  Computed<TransactionModel> _$transactionComputed;

  @override
  TransactionModel get transaction => (_$transactionComputed ??=
          Computed<TransactionModel>(() => super.transaction,
              name: '_TransacionDetailsControllerBase.transaction'))
      .value;

  final _$editModeAtom =
      Atom(name: '_TransacionDetailsControllerBase.editMode');

  @override
  bool get editMode {
    _$editModeAtom.reportRead();
    return super.editMode;
  }

  @override
  set editMode(bool value) {
    _$editModeAtom.reportWrite(value, super.editMode, () {
      super.editMode = value;
    });
  }

  final _$addTransactionModeAtom =
      Atom(name: '_TransacionDetailsControllerBase.addTransactionMode');

  @override
  bool get addTransactionMode {
    _$addTransactionModeAtom.reportRead();
    return super.addTransactionMode;
  }

  @override
  set addTransactionMode(bool value) {
    _$addTransactionModeAtom.reportWrite(value, super.addTransactionMode, () {
      super.addTransactionMode = value;
    });
  }

  final _$_TransacionDetailsControllerBaseActionController =
      ActionController(name: '_TransacionDetailsControllerBase');

  @override
  dynamic verifyMode() {
    final _$actionInfo = _$_TransacionDetailsControllerBaseActionController
        .startAction(name: '_TransacionDetailsControllerBase.verifyMode');
    try {
      return super.verifyMode();
    } finally {
      _$_TransacionDetailsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleEditMode() {
    final _$actionInfo = _$_TransacionDetailsControllerBaseActionController
        .startAction(name: '_TransacionDetailsControllerBase.toggleEditMode');
    try {
      return super.toggleEditMode();
    } finally {
      _$_TransacionDetailsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic addTransaction(TransactionModel model) {
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
editMode: ${editMode},
addTransactionMode: ${addTransactionMode},
transaction: ${transaction}
    ''';
  }
}
