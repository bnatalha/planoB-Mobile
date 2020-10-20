import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
part 'logged_user_store.g.dart';

class LoggedUserStore = _LoggedUserStoreBase with _$LoggedUserStore;

abstract class _LoggedUserStoreBase with Store {
  @observable
  Observable<UserModel> currentUser = Observable<UserModel>(null);

  @action
  void setCurrentUser(UserModel user) {
    currentUser.value = user;
  }
}
