import '../../models/user_model.dart';
import 'session_repository_interface.dart';

class SessionRepository implements ISessionRepository {
  @override
  void dispose() {
    // TODO(felipe): implement dispose
  }

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  void setLoggedUser(UserModel user) {
    // TODO: implement setLoggedUser
  }

  @override
  // TODO: implement currentLoggedUser
  UserModel get currentLoggedUser => throw UnimplementedError();
}
