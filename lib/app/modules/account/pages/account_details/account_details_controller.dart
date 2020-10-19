import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/modules/account/stores/account_store.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
part '../account_details_controller.g.dart';

class AccountDetailsController = _AccountDetailsControllerBase with _$AccountDetailsController;

abstract class _AccountDetailsControllerBase with Store {
  
  _AccountDetailsControllerBase(this._accountStore) {}

  final AccountStore _accountStore;

  @computed
  AccountModel get account => _accountStore.account;
  
}