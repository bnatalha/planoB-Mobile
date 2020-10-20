import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/transaction_repository_abstract.dart';
import 'package:plano_b/app/shared/services/account_service.dart';
import 'package:plano_b/app/shared/services/transaction_service.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';

part 'transaction_details_controller.g.dart';

class TransactionDetailsController = _TransacionDetailsControllerBase
    with _$TransactionDetailsController;

abstract class _TransacionDetailsControllerBase with Store {
  final TransactionService _transactionService =
      Modular.get<TransactionService>();

  final AccountService _accountService = Modular.get<AccountService>();

  final LoggedUserStore _loggedUserStore = Modular.get();

  final TransactionStore _transactionStore;

  @observable
  ObservableList<AccountModel> accounts = <AccountModel>[].asObservable();

  @observable
  AccountModel srcSelectedAccount = AccountModel();

  @observable
  AccountModel destSelectedAccount = AccountModel();

  @computed
  bool get isCreateTransactionMode =>
      _transactionStore.pageMode == TransactionMode.create;

  @computed
  bool get isViewTransactionMode =>
      _transactionStore.pageMode == TransactionMode.view;

  @computed
  bool get isEditTransactionMode =>
      _transactionStore.pageMode == TransactionMode.edit;

  @action
  setSrcAccount(AccountModel acc) {
    srcSelectedAccount = acc;
  }

  @action
  setDestAccount(AccountModel acc) {
    destSelectedAccount = acc;
  }

  @action
  UserModel getCurrentLoggedUser() {
    return _loggedUserStore.currentUser.value;
  }

  // @action
  // verifyMode() {

  // }

  @action
  toggleEditMode() {
    final mode = _transactionStore.pageMode.index;
    if (mode == TransactionMode.edit.index) {
      _transactionStore.pageMode = TransactionMode.view;
    } else {
      _transactionStore.pageMode = TransactionMode.edit;
    }
  }

  @action
  fetchAccounts() async {
    final user = _loggedUserStore.currentUser.value;
    final currentId = user.id;

    // fetch user account list
    accounts = (await _accountService.getAccountsOfUser(userId: currentId))
        .asObservable();

    // populate select accounts
    if (isViewTransactionMode) {
      srcSelectedAccount =
          _transactionStore?.transaction?.source ?? accounts.first;
      destSelectedAccount =
          _transactionStore?.transaction?.destination ?? accounts.last;
    } else if (isCreateTransactionMode) {
      srcSelectedAccount = accounts.first;
      destSelectedAccount = accounts.last;
    }
  }

  _TransacionDetailsControllerBase(this._transactionStore) {
    // editMode = false;
    fetchAccounts();
  }

  // TODO: corrigir
  @action
  addTransaction(TransactionModel model) {
    _transactionStore.transaction = model;
    _transactionService.addTransaction(
      user: model.user,
      destination: model.destination,
      source: model.source,
      value: model.value,
      description: model.description,
      // tags: ['tag1, tag2'],
      category: model.category,
    );
  }

  @computed
  TransactionModel get transaction => _transactionStore.transaction;

  @action
  updateTransaction(TransactionModel model) {
    _transactionStore.transaction = model;
    _transactionService.updateTransaction(
      id: model.id,
      user: model.user,
      source: model.source,
      destination: model.destination,
      value: model.value,
      description: model.description,
      category: model.category,
    );
  }
}
