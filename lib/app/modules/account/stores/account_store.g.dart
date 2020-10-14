// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountStore on _AccountStoreBase, Store {
  final _$accountAtom = Atom(name: '_AccountStoreBase.account');

  @override
  AccountModel get account {
    _$accountAtom.reportRead();
    return super.account;
  }

  @override
  set account(AccountModel value) {
    _$accountAtom.reportWrite(value, super.account, () {
      super.account = value;
    });
  }

  final _$_AccountStoreBaseActionController =
      ActionController(name: '_AccountStoreBase');

  @override
  void setAccount(AccountModel model) {
    final _$actionInfo = _$_AccountStoreBaseActionController.startAction(
        name: '_AccountStoreBase.setAccount');
    try {
      return super.setAccount(model);
    } finally {
      _$_AccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
account: ${account}
    ''';
  }
}
