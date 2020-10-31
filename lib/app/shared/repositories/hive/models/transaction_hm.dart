import 'package:hive/hive.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'model.dart';

part 'transaction_hm.g.dart';

@HiveType(typeId: 11)
class TransactionHM extends Model {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int userId;

  @HiveField(2)
  final int srcAccountId;

  @HiveField(3)
  final int destAccountId;

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

  const TransactionHM(
    this.id,
    this.userId,
    this.srcAccountId,
    this.destAccountId,
    this.value,
    this.description,
    this.tags,
    this.category,
    this.date,
  );

  @override
  // TODO( ): retornar um user_hm no lugar do userId
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'srcAccountId': srcAccountId,
      'destAccountId': destAccountId,
      'value': value,
      'description': description,
      'tags': tags,
      'category': category,
      'date': date,
    };
  }
}
