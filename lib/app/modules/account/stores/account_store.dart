import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
part 'account_store.g.dart';

class AccountStore = _AccountStoreBase with _$AccountStore;

abstract class _AccountStoreBase with Store {
  @observable
  AccountModel account = AccountModel();

  @action
  void setAccount(AccountModel model) => account = model;
}
