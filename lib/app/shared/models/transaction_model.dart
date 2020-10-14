import 'package:hive/hive.dart';
import './category_model.dart';
import 'model.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 11)
class TransactionModel extends Model {
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

  const TransactionModel({
    this.id,
    this.accountId,
    this.fromUserId,
    this.toUserId,
    this.value,
    this.description,
    this.tags,
    this.category,
  });

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
