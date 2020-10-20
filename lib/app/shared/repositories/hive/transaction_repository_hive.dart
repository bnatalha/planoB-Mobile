// import 'package:plano_b/app/shared/models/transaction_model.dart';

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/utils/box_names.dart';

import '../abstract/transaction_repository_abstract.dart';

class TransactionRepositoryHive implements TransactionRepositoryAbstract {
  Box<String> hive;

  TransactionRepositoryHive() {
    _initBox();
  }

  Future<void> _initBox() async {
    hive = Boxes.boxes[Boxes.transactionRepositoryBoxName];
  }

  @override
  void dispose() {
    hive.close();
  }

  @override
  Future<Map<String, dynamic>> getTransactionFromId(int id) {
    try {
      return jsonDecode(hive.get(id));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsFromAccountId(
    int accountId,
  ) async {
    final List<TransactionModel> allTransactions = hive.values.map(
      (String value) => TransactionModel.fromJson(jsonDecode(value)),
    );

    allTransactions.retainWhere(
      (TransactionModel t) => t.source.id == accountId,
    );

    return allTransactions.map((TransactionModel t) => t.toJson()).toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsFromAccountWithCategory(
    int accountId,
    CategoryModel category,
  ) async {
    try {
      final List<TransactionModel> transactions = hive.values
          .map((String value) => TransactionModel.fromJson(jsonDecode(value)));
      return transactions
          .where((TransactionModel model) => model.category == category)
          .map((TransactionModel m) => m.toJson())
          .toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsFromAccountWithTag(
    int accountId,
    String tag,
  ) async {
    try {
      final List<TransactionModel> transactions = hive.values
          .map((String t) => TransactionModel.fromJson(jsonDecode(t)));
      return transactions
          .where((TransactionModel model) => model.tags.contains(tag))
          .map((TransactionModel model) => model.toJson())
          .toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> removeTransaction({int transactionId}) async {
    try {
      hive.delete(transactionId);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> addTransaction({
    UserModel user,
    AccountModel source,
    AccountModel destination,
    double value,
    String description,
    DateTime date,
    CategoryModel category,
  }) async {
    try {
      final TransactionModel transaction = TransactionModel(
        id: '${user.id}${source.hashCode}${destination.hashCode}${value.hashCode}${date.hashCode}'
            .hashCode,
        user: user,
        source: source,
        destination: destination,
        value: value,
        description: description,
        date: date,
        category: category,
      );

      hive.put(transaction.id, jsonEncode(transaction.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateTransaction({
    int id,
    UserModel user,
    AccountModel source,
    AccountModel destination,
    double value,
    String description,
    DateTime date,
    CategoryModel category,
  }) async {
    try {
      TransactionModel model =
          TransactionModel.fromJson(jsonDecode(hive.get(id)));
      if (model != null) {
        if (user != null) model.user = user;
        if (source != null) model.source = source;
        if (destination != null) model.destination = destination;
        if (value != null) model.value = value;
        if (description != null) model.description = description;
        if (category != null) model.category = category;
        if (date != null) model.date = date;
      }
      hive.put(model.id, jsonEncode(model.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }
}
