import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/services/account_service.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';

import 'stores/account_store.dart';
part 'account_controller.g.dart';

class AccountController = _AccountControllerBase with _$AccountController;

abstract class _AccountControllerBase with Store {
  final AccountStore account;
  final AccountService accountService;
  final LoggedUserStore loggedUserStore;

  @observable
  ObservableList<AccountModel> accountsList = <AccountModel>[].asObservable();

  _AccountControllerBase(
    this.account,
    this.accountService,
    this.loggedUserStore,
  ) {
    fetchAccounts();
  }

  @action
  Future<void> fetchAccounts() async {
    final user = loggedUserStore.currentUser.value;

    accountsList = (await accountService.getAccountsOfUser(userId: user.id)).asObservable();
  }

  @action
  Future<bool> deleteAccount({int accountId}) async {
    print('Deleting accuont $accountId');
    if(await accountService.deleteAccount(accountId: accountId)) {

      print('Deleted!');
      return true;
    }
    return false;
  }
}
