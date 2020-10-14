import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

import 'stores/account_store.dart';
part 'account_controller.g.dart';

class AccountController = _AccountControllerBase with _$AccountController;

abstract class _AccountControllerBase with Store {
  final AccountStore account;

  @observable
  ObservableList<AccountModel> accountsList = <AccountModel>[].asObservable();

  _AccountControllerBase(this.account);

  @action
  Future<void> updateAccounts() async {
    final user = UserModel(
      login: 'loginDummy',
      name: 'Foolano',
    );
    accountsList = <AccountModel>[
      AccountModel(
        user: user,
        name: 'nubank',
        balance: 300.0,
      ),
      AccountModel(
        user: user,
        name: 'BB',
        balance: 456.4,
      ),
      AccountModel(
        user: user,
        name: 'Caixa',
        balance: 722.56,
      ),
    ].asObservable();
  }
}
