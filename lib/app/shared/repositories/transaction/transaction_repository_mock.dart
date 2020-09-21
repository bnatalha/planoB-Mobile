import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

import 'transaction_repository_interface.dart';

/// Mock Version
class TransactionRepositoryMock implements ITransactionRepository {
  UserModel mockUser;
  CategoryModel mockCategory1;
  CategoryModel mockCategory2;
  AccountModel mockAccountSource;
  AccountModel mockAccountDestination;

  List<TransactionModel> mockTransactions = [];

  TransactionRepositoryMock() {
    mockUser = UserModel(login: 'admin', name: 'Dan', password: 'admin');

    mockCategory1 = CategoryModel(
        user: mockUser, name: "Cat 1", description: "Categoria de numero 1");

    mockCategory2 = CategoryModel(
        user: mockUser, name: "Cat 2", description: "Categoria de numero 2");

    mockAccountSource =
        AccountModel(user: mockUser, name: "Nubank", balance: 100000.0);

    mockAccountDestination = AccountModel(
        user: mockUser, name: "Banco do Brasil", balance: 100000.0);

    mockTransactions.addAll([
      TransactionModel(
        id: 1231,
        user: mockUser,
        source: mockAccountSource,
        destination: mockAccountDestination,
        category: mockCategory2,
        date: DateTime.now(),
        value: 32,
        description: "um exemplo",
      ),
      TransactionModel(
        id: 32123,
        user: mockUser,
        source: mockAccountSource,
        destination: mockAccountDestination,
        category: mockCategory1,
        date: DateTime.now(),
        value: 50,
        description: "outro exemplo",
      )
    ]);
  }

  Future<List<TransactionModel>> fetchTransactionsForCurrentUser() async {
    await Future.delayed(Duration(milliseconds: 200));
    return mockTransactions;
  }

  Future<String> addTransaction(TransactionModel model) async {
    mockTransactions.add(model);
    await Future.delayed(Duration(milliseconds: 200));
    return 'success';
  }

  Future<String> updateTransaction(TransactionModel model) async {
    int i = mockTransactions.indexWhere((e) => e.id == model.id);
    mockTransactions[i] = model;
    await Future.delayed(Duration(milliseconds: 200));
    return 'success';
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
