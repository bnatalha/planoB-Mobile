import 'package:hive/hive.dart';

import 'model.dart';

@HiveType(typeId: 12)
class AccountModel extends Model {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int userId;

  @HiveField(2)
  final String bankName;

  const AccountModel({
    this.id,
    this.userId,
    this.bankName,
  });

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
