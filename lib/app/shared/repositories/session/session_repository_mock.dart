import '../../models/user_model.dart';
import 'session_repository_interface.dart';

class SessionRepositoryMock implements ISessionRepository {
  UserModel _currentLoggedUser;
  
  UserModel get currentLoggedUser => _currentLoggedUser;

  void setLoggedUser(UserModel user) {
    _currentLoggedUser = user;
  }

  void logout() {
    _currentLoggedUser = null;
  }

  @override
  void dispose() {}
}
