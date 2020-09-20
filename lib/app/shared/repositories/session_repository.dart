import 'package:flutter_modular/flutter_modular.dart';

import '../models/user_model.dart';

class SessionRepository extends Disposable {

  UserModel _currentLoggedUser;
  UserModel get currentLoggedUser => _currentLoggedUser;

  void setLoggedUser(UserModel user) {
    _currentLoggedUser = user;
  }

  void logout() {
    _currentLoggedUser = null;
  }

  @override
  void dispose() {
    // TODO(felipe): implement dispose
  }
}
