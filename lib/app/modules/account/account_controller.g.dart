// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountController on _AccountControllerBase, Store {
  final _$accountsListAtom = Atom(name: '_AccountControllerBase.accountsList');

  @override
  ObservableList<AccountModel> get accountsList {
    _$accountsListAtom.reportRead();
    return super.accountsList;
  }

  @override
  set accountsList(ObservableList<AccountModel> value) {
    _$accountsListAtom.reportWrite(value, super.accountsList, () {
      super.accountsList = value;
    });
  }

  final _$updateAccountsAsyncAction =
      AsyncAction('_AccountControllerBase.updateAccounts');

  @override
  Future<void> updateAccounts() {
    return _$updateAccountsAsyncAction.run(() => super.updateAccounts());
  }

  @override
  String toString() {
    return '''
accountsList: ${accountsList}
    ''';
  }
}
