import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/services/user_service.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserService service = Modular.get();

  @observable
  Observable<bool> isLogged = Observable<bool>(false);

  @observable
  Observable<bool> isLoading = Observable<bool>(false);

  @action
  Future<bool> login({String username, String password}) async {

    service.createUser(username: username, password: password, displayName: 'null');

    isLoading.value = true;
    final UserModel model = await service.login(username: username, password: password);

    // TODO: Take advantage of [UserModel] here
    isLoading.value = false;
    if(model != null) {
      return true;
    } else {
      return false;
    }
  }
}
