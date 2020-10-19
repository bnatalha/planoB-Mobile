// import 'package:plano_b/app/shared/models/transaction_model.dart';

import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/mock/mock_models.dart';

import '../abstract/transaction_repository_abstract.dart';

class TransactionRepositoryMock implements TransactionRepositoryAbstract {
  int _idCount = 4;
  final _duration = Duration(milliseconds: 100);

  @override
  void dispose() {}

  @override
  Future<Map<String, dynamic>> getTransactionFromId(int id) {
    final result = transMockList.firstWhere((e) => e.id == id).toJson();
    return Future.delayed(_duration).then((value) => result);
  }

  // TODO
  @override
  Future<List<Map<String, dynamic>>> getTransactionsFromAccountId(
      int accountId) {
    final result = transMockList.map((e) => e.toJson()).toList();
    return Future.delayed(_duration).then((value) => result);
  }

  // TODO
  @override
  Future<List<Map<String, dynamic>>> getTransactionsFromAccountWithCategory(
      int accountId, CategoryModel category) {
    final result = transMockList.map((e) => e.toJson()).toList();
    return Future.delayed(_duration).then((value) => result);
  }

  // TODO
  @override
  Future<List<Map<String, dynamic>>> getTransactionsFromAccountWithTag(
      int accountId, String tag) {
    final result = transMockList.map((e) => e.toJson()).toList();
    return Future.delayed(_duration).then((value) => result);
  }

  @override
  Future<bool> addTransaction(
      {int userId,
      int toUserId,
      int accountId,
      double value,
      String description,
      List<String> tags,
      CategoryModel category}) {
    final t = TransactionModel(
      id: _idCount++,
      user: userMock1,
      source: accMock1,
      destination: accMock2,
      category: category,
      date: DateTime.now(),
      value: value,
      description: description,
    );

    transMockList.add(t);
    return Future.delayed(_duration).then((value) => true);

  }

  @override
  Future<bool> removeTransaction({int transactionId}) {
    transMockList.removeWhere((e) => e.id == transactionId);
    return Future.delayed(_duration).then((value) => true);
  }
}
