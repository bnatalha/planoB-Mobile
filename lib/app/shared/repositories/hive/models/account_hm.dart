import 'package:hive/hive.dart';

import 'model.dart';

part 'account_hm.g.dart';

@HiveType(typeId: 12)
class AccountHM extends Model {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final int userId;

  @HiveField(2)
  final String bankName;

  AccountHM(this.id, this.userId, this.bankName);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'bankName': bankName,
    };
  }
}
