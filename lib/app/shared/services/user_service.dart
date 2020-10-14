import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/repositories/abstract/user_repository_abstract.dart';

class UserService {
  const UserService({@required this.userRepository})
      : assert(userRepository != null);

  final UserRepositoryAbstract userRepository;
}
