import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/repositories/mock/mock_models.dart';

import '../abstract/account_repository_abstract.dart';

class AccountRepositoryMock implements AccountRepositoryAbstract {
  int _idCount = 3;
  final _duration = Duration(milliseconds: 100);

  @override
  void dispose() {}

  @override
  Future<bool> createAccount(int userId, String bankName) {
    final a = AccountModel(
      id: _idCount++,
      balance: 0.0,
      name: bankName,
      user: userMockList.firstWhere((e) => e.id == userId)
    );

    accMockList.add(a);
    return Future.delayed(_duration).then((value) => true);
  }

  @override
  Future<bool> deleteAccount(int id) {
    accMockList.removeWhere((e) => e.id == id);
    return Future.delayed(_duration).then((value) => true);
  }

  @override
  Future<Map<String, dynamic>> getAccountFromId(int id) {
    final result = accMockList.firstWhere((e) => e.id == id).toJson();
    return Future.delayed(_duration).then((value) => result);
  }

  @override
  Future<List<Map<String, dynamic>>> getAccountsFromUserId(int userId) {
    final result = accMockList.map((e) => e.toJson()).toList();
    return Future.delayed(_duration).then((value) => result);
  }

  @override
  Future<bool> updateAccountBankName(int id, String newBankName) {
    AccountModel a = accMockList.firstWhere((e) => e.id == id);
    int i = accMockList.indexOf(a);

    final newAcc = a.copyWith(name: newBankName);
    accMockList[i] = newAcc;

    return Future.delayed(_duration).then((value) => true);
  }
}
