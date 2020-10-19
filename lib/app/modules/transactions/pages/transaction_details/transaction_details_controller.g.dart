// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionDetailsController
    on _TransacionDetailsControllerBase, Store {
  Computed<bool> _$isCreateTransactionModeComputed;

  @override
  bool get isCreateTransactionMode => (_$isCreateTransactionModeComputed ??=
          Computed<bool>(() => super.isCreateTransactionMode,
              name: '_TransacionDetailsControllerBase.isCreateTransactionMode'))
      .value;
  Computed<bool> _$isViewTransactionModeComputed;

  @override
  bool get isViewTransactionMode => (_$isViewTransactionModeComputed ??=
          Computed<bool>(() => super.isViewTransactionMode,
              name: '_TransacionDetailsControllerBase.isViewTransactionMode'))
      .value;
  Computed<bool> _$isEditTransactionModeComputed;

  @override
  bool get isEditTransactionMode => (_$isEditTransactionModeComputed ??=
          Computed<bool>(() => super.isEditTransactionMode,
              name: '_TransacionDetailsControllerBase.isEditTransactionMode'))
      .value;
  Computed<TransactionModel> _$transactionComputed;

  @override
  TransactionModel get transaction => (_$transactionComputed ??=
          Computed<TransactionModel>(() => super.transaction,
              name: '_TransacionDetailsControllerBase.transaction'))
      .value;

  final _$accountsAtom =
      Atom(name: '_TransacionDetailsControllerBase.accounts');

  @override
  ObservableList<AccountModel> get accounts {
    _$accountsAtom.reportRead();
    return super.accounts;
  }

  @override
  set accounts(ObservableList<AccountModel> value) {
    _$accountsAtom.reportWrite(value, super.accounts, () {
      super.accounts = value;
    });
  }

  final _$srcSelectedAccountAtom =
      Atom(name: '_TransacionDetailsControllerBase.srcSelectedAccount');

  @override
  AccountModel get srcSelectedAccount {
    _$srcSelectedAccountAtom.reportRead();
    return super.srcSelectedAccount;
  }

  @override
  set srcSelectedAccount(AccountModel value) {
    _$srcSelectedAccountAtom.reportWrite(value, super.srcSelectedAccount, () {
      super.srcSelectedAccount = value;
    });
  }

  final _$destSelectedAccountAtom =
      Atom(name: '_TransacionDetailsControllerBase.destSelectedAccount');

  @override
  AccountModel get destSelectedAccount {
    _$destSelectedAccountAtom.reportRead();
    return super.destSelectedAccount;
  }

  @override
  set destSelectedAccount(AccountModel value) {
    _$destSelectedAccountAtom.reportWrite(value, super.destSelectedAccount, () {
      super.destSelectedAccount = value;
    });
  }

  final _$fetchAccountsAsyncAction =
      AsyncAction('_TransacionDetailsControllerBase.fetchAccounts');

  @override
  Future fetchAccounts() {
    return _$fetchAccountsAsyncAction.run(() => super.fetchAccounts());
  }

  final _$_TransacionDetailsControllerBaseActionController =
      ActionController(name: '_TransacionDetailsControllerBase');

  @override
  dynamic setSrcAccount(AccountModel acc) {
    final _$actionInfo = _$_TransacionDetailsControllerBaseActionController
        .startAction(name: '_TransacionDetailsControllerBase.setSrcAccount');
    try {
      return super.setSrcAccount(acc);
    } finally {
      _$_TransacionDetailsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDestAccount(AccountModel acc) {
    final _$actionInfo = _$_TransacionDetailsControllerBaseActionController
        .startAction(name: '_TransacionDetailsControllerBase.setDestAccount');
    try {
      return super.setDestAccount(acc);
    } finally {
      _$_TransacionDetailsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  UserModel getCurrentLoggedUser() {
    final _$actionInfo =
        _$_TransacionDetailsControllerBaseActionController.startAction(
            name: '_TransacionDetailsControllerBase.getCurrentLoggedUser');
    try {
      return super.getCurrentLoggedUser();
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
  dynamic updateTransaction(TransactionModel model) {
    final _$actionInfo =
        _$_TransacionDetailsControllerBaseActionController.startAction(
            name: '_TransacionDetailsControllerBase.updateTransaction');
    try {
      return super.updateTransaction(model);
    } finally {
      _$_TransacionDetailsControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accounts: ${accounts},
srcSelectedAccount: ${srcSelectedAccount},
destSelectedAccount: ${destSelectedAccount},
isCreateTransactionMode: ${isCreateTransactionMode},
isViewTransactionMode: ${isViewTransactionMode},
isEditTransactionMode: ${isEditTransactionMode},
transaction: ${transaction}
    ''';
  }
}
