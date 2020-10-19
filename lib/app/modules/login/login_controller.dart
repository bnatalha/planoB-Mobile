import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/services/user_service.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserService service = Modular.get();
  final LoggedUserStore _loggedUserStore = Modular.get();

  @computed
  UserModel get currentUser => _loggedUserStore.currentUser.value;

  @observable
  Observable<bool> isLogged = Observable<bool>(false);

  @observable
  Observable<bool> isLoading = Observable<bool>(false);

  @action
  Future<bool> login({
    String username,
    String password,
    bool create = false,
  }) async {
    if (create) {
      final result = await service.createUser(
        username: username,
        password: password,
        displayName: username,
      );
      if (!result) {
        return false;
      }
    }

    isLoading.value = true;
    _loggedUserStore.currentUser.value = await service.login(
      username: username,
      password: password,
    );

    isLoading.value = false;
    return _loggedUserStore.currentUser.value != null;
  }
}
