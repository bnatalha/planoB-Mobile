import 'package:flutter_modular/flutter_modular.dart';

import '../../models/user_model.dart';

abstract class ISessionRepository extends Disposable {
  UserModel get currentLoggedUser;
  void setLoggedUser(UserModel user);
  void logout();
}
