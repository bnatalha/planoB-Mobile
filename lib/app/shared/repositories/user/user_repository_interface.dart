import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

import '../repository.dart';

abstract class IUserRepository extends Repository {
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
