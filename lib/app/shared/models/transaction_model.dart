import 'package:flutter/foundation.dart';

import 'user_model.dart';
import 'account_model.dart';
import 'category_model.dart';

class TransactionModel {
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
