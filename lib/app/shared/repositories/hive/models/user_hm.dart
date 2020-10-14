import 'package:hive/hive.dart';

import 'model.dart';

part 'user_hm.g.dart';

@HiveType(typeId: 10)
class UserHM extends Model {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String displayName;

  UserHM({this.id, this.username, this.password, this.displayName});

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
