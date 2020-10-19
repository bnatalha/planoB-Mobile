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
  bool editMode;

  @observable
  bool addTransactionMode;

  @observable
  ObservableList<AccountModel> accounts = <AccountModel>[].asObservable();

  @observable
  AccountModel srcSelectedAccount = AccountModel();

  @action
  setSrcAccount(AccountModel acc) {
    srcSelectedAccount = acc;
  }

  @action
  UserModel getCurrentLoggedUser() {
    return _loggedUserStore.currentUser.value;
  }

  @action
  verifyMode() {
    addTransactionMode = _transactionStore.isAddingNewTransaction;
    if (addTransactionMode) {
      editMode = true;
    }
  }

  @action
  toggleEditMode() {
    editMode = !editMode;
  }

  @action
  updateAccounts() async {
    final user = _loggedUserStore.currentUser.value;
    final currentId = user.id;
    accounts = (await _accountService.getAccountsOfUser(userId: currentId))
        .asObservable();
    srcSelectedAccount = accounts.first;
  }

  _TransacionDetailsControllerBase(this._transactionStore) {
    editMode = false;
    updateAccounts();
  }

  // TODO: corrigir
  @action
  addTransaction(TransactionModel model) {
    _transactionStore.transaction = model;
    _transactionService.addTransaction(
      // user: int.parse(model.user.name),
      // destination: 123123,
      // source: 2,
      value: model.value,
      description: model.description,
      // tags: ['tag1, tag2'],
      category: model.category,
    );
  }

  @computed
  TransactionModel get transaction => _transactionStore.transaction;

  // TODO: corrigir
  // @action
  set transaction(TransactionModel model) {
    _transactionStore.transaction = model;

    _transactionService.updateTransaction(
      // userId: int.parse(model.user.name),
      // toUserId: 123123,
      // accountId: 2,
      value: model.value,
      description: model.description,
      // tags: ['tag1, tag2'],
      category: model.category,
    );
  }
}
