import 'package:flutter/foundation.dart';

import 'user_model.dart';
import 'account_model.dart';
import 'category_model.dart';

class TransactionModel {
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
}
