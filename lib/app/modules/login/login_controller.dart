import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// import 'package:plano_b/app/shared/repositories/session/session_repository_interface.dart';
// import 'package:plano_b/app/shared/repositories/user/hive_user_repository.dart';
// import 'package:plano_b/app/shared/repositories/user/user_repository_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  // final IUserRepository repository = Modular.get();
  // final ISessionRepository sessionRepository = Modular.get();

  @observable
  Observable<bool> isLogged = Observable<bool>(false);

  @observable
  Observable<bool> isLoading = Observable<bool>(false);

  @action
  Future<bool> login({String username, String password}) async {
    // return await repository.authUser(username: username, password: password);
    return true;
    /*
    isLoading.value = true;
    await Future<bool>.delayed(const Duration(seconds: 1), () => true);
    final bool result = await repository.authUser(
      username: username,
      password: password,
    );

    if (result) {
      sessionRepository
          .setLoggedUser(await repository.getUser(username: username));
    }

    isLoading.value = false;
    return result;
    */
  }
}
