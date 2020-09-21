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

  final _$enableEditAtom =
      Atom(name: '_TransacionDetailsControllerBase.enableEdit');

  @override
  bool get enableEdit {
    _$enableEditAtom.reportRead();
    return super.enableEdit;
  }

  @override
  set enableEdit(bool value) {
    _$enableEditAtom.reportWrite(value, super.enableEdit, () {
      super.enableEdit = value;
    });
  }

  final _$_TransacionDetailsControllerBaseActionController =
      ActionController(name: '_TransacionDetailsControllerBase');

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
  String toString() {
    return '''
enableEdit: ${enableEdit},
transaction: ${transaction}
    ''';
  }
}
