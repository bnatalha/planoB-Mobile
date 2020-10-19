// import 'package:plano_b/app/shared/models/transaction_model.dart';

import 'package:hive/hive.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
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
      int accountId) {
    // TODO: implement getTransactionsFromAccountId
    throw UnimplementedError();
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
  Future<bool> addTransaction({
    int userId,
    int toUserId,
    int accountId,
    double value,
    String description,
    List<String> tags,
    CategoryModel category,
  }) {

  }

  @override
  Future<bool> removeTransaction({int transactionId}) {
    // TODO: implement removeTransaction
    throw UnimplementedError();
  }
}
