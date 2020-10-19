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
    // TODO: implement getTransactionFromId
    throw UnimplementedError();
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
      int accountId, CategoryModel category) {
    // TODO: implement getTransactionsFromAccountWithCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsFromAccountWithTag(
      int accountId, String tag) {
    // TODO: implement getTransactionsFromAccountWithTag
    throw UnimplementedError();
  }

  @override
  Future<bool> removeTransaction({int transactionId}) {
    // TODO: implement removeTransaction
    throw UnimplementedError();
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
  Future<bool> updateTransaction({int id, UserModel user, AccountModel source, AccountModel destination, double value, String description, DateTime date, CategoryModel category}) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
