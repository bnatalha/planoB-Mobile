import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/services/user_service.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserService service = Modular.get();

  @observable
  Observable<UserModel> userModel = Observable<UserModel>(null);

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
      service.createUser(
        username: username,
        password: password,
        displayName: 'null',
      );
      return true;
    }

    isLoading.value = true;
    userModel.value = await service.login(
      username: username,
      password: password,
    );

    isLoading.value = false;
    return userModel.value != null;
  }
}
