import '../../models/user_model.dart';
import '../repository.dart';

abstract class ISessionRepository extends Repository {
  UserModel get currentLoggedUser;
  void setLoggedUser(UserModel user);
  void logout();
}
