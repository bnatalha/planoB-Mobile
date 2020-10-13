import 'account_model.dart';
import 'category_model.dart';
import 'model.dart';
import 'user_model.dart';

class TransactionModel implements Model {
  final int id;
  final UserModel user;
  final AccountModel source;
  final AccountModel destination;
  // final String paymentType;
  final CategoryModel category;
  final double value;
  final String description;
  final DateTime date;
  // final List<String> tags;   // TODO pra q?

  const TransactionModel({
    this.id,
    this.user,
    this.source,
    this.destination,
    // this.paymentType,
    this.category,
    this.date,
    this.value = 0.0,
    this.description = "",
    // this.tags,
  });

  @override
  TransactionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user = UserModel.fromJson(json['user']),
        source = json['source'],
        destination = AccountModel.fromJson(json['destination']),
        category = CategoryModel.fromJson(json['category']),
        date = DateTime.parse(json['date']),
        value = json['value'],
        description = json['description'];

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user.toJson,
        'source': source,
        'destination': destination.toJson(),
        'category': category.toJson(),
        'date': date.toString(),
        'value': value,
        'description': description,
      };

  copyWith({
    int id,
    UserModel user,
    AccountModel source,
    AccountModel destination,
    // final String paymentType,
    CategoryModel category,
    double value,
    String description,
    DateTime date,
    // final List<String> tags;,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      user: user ?? this.user,
      source: source ?? this.source,
      destination: destination ?? this.destination,
      // this: this ?? // this.paymentType,
      category: category ?? this.category,
      date: date ?? this.date,
      value: value ?? this.value,
      description: description ?? this.description,
      // this: this ?? // this.tags,
    );
  }
}
