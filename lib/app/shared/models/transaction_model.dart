import 'dart:convert';

import 'user_model.dart';
import 'account_model.dart';
import 'category_model.dart';

class TransactionModel {
  int id;
  UserModel user;
  AccountModel source;
  AccountModel destination;
  // final String paymentType;
  CategoryModel category;
  double value;
  String description;
  DateTime date;
  final List<String> tags;   // TODO pra q?

  TransactionModel({
    this.id,
    this.user,
    this.source,
    this.destination,
    // this.paymentType,
    this.category,
    this.date,
    this.value = 0.0,
    this.description = "",
    this.tags,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as int,
      user: json['user'] as UserModel,
      source: json['source'] as AccountModel,
      destination: json['destination'] as AccountModel,
      category: json['category'] as CategoryModel,
      date: json['date'] as DateTime,
      value: json['value'] ?? 0.0,
      description: json['description'] ?? "",
      tags: jsonDecode(json['tags']) ?? <String>[],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'source': source,
      'destination': destination,
      'category': category,
      'date': date,
      'value': value,
      'description': description,
      'tags': jsonEncode(tags),
    };
  }

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
    List<String> tags,
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
      tags: tags ?? this.tags
    );
  }
}
