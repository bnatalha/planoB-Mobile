import 'package:hive/hive.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'model.dart';

part 'transaction_hm.g.dart';

@HiveType(typeId: 11)
class TransactionHM extends Model {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int fromUserId;

  @HiveField(2)
  final int toUserId;

  @HiveField(3)
  final int accountId;

  @HiveField(4)
  final double value;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final List<String> tags;

  @HiveField(7)
  final CategoryModel category;

  @HiveField(8)
  final DateTime date;

  const TransactionHM({
    this.id,
    this.accountId,
    this.fromUserId,
    this.toUserId,
    this.value,
    this.description,
    this.tags,
    this.category,
    this.date, 
  });

  @override
  // TODO( ): retornar um user_hm no lugar do userId
  Map<String, dynamic> toJson() {
    return <String,dynamic>{
      'id': id,
      'accountId': accountId,
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'value': value,
      'description': description,
      'tags': tags,
      'category': category,
      'date': date, 
    };
  }
}
