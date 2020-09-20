import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

abstract class IUserRepository extends Disposable {
  Future<bool> addUser({
    @required String username,
    @required String password,
  });

  Future<bool> removeUser({
    @required String username,
  });

  Future<bool> changeUserFirstName({
    @required String username,
    @required String toName,
  });

  // Future<bool> changeUserLastName({
  //   @required String username,
  //   @required String toName,
  // });

  Future<bool> changeUserPassword({
    @required String username,
    @required String toPassword,
  });

  Future<UserModel> getUser({@required String username});

  Future<bool> authUser({
    @required String username,
    @required String password,
  });
}
