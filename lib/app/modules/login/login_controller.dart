import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/repositories/session_repository.dart';
import '../../shared/repositories/user_repository.dart';


part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserRepository repository = Modular.get();
  final SessionRepository sessionRepository = Modular.get();

  @observable
  Observable<bool> isLogged = Observable<bool>(false);

  @observable
  Observable<bool> isLoading = Observable<bool>(false);

  @action
  Future<bool> login({String username, String password}) async {
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
  }
}
