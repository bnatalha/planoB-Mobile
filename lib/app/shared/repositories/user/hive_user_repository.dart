import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/repositories/user/user_repository_interface.dart';
import 'package:hive/hive.dart';

class HiveUserRepository extends IUserRepository {
  HiveUserRepository() {
    _openBox();
  }

  Box hiveBox;

  Future<void> _openBox() async {
    hiveBox = await Hive.openBox('userRepo');
  }

  @override
  Future<bool> addUser({String username, String password, String name}) async {
    try {
      await hiveBox.put(username, password);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> authUser({String username, String password}) async {
    try {
      final String dbPassword = await hiveBox.get(username); 
      if(dbPassword != null && dbPassword == password) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> changeUserFirstName({String username, String toName}) async {
    // TODO: implement changeUserFirstName
    throw UnimplementedError();
  }

  @override
  Future<bool> changeUserPassword({String username, String toPassword}) async {
    // TODO: implement changeUserFirstName
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<UserModel> getUser({String username}) async {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> removeUser({String username}) async {
    // TODO: implement removeUser
    throw UnimplementedError();
  }
}
