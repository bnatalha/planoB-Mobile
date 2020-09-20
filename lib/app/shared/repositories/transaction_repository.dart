import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/home/components/transaction_details/transaction_details_controller.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

/// Mock Version
class TransactionRepository extends Disposable {
  UserModel mockUser;
  CategoryModel mockCategory1;
  CategoryModel mockCategory2;
  AccountModel mockAccountSource;
  AccountModel mockAccountDestination;

  List<TransactionModel> mockTransactions = [];

  TransactionRepository() {
    mockUser =
        UserModel(login: 'default', name: 'Meu nome Aqui', password: '123123');
    mockCategory1 = CategoryModel(user: mockUser, name: "Cat 1");
    mockCategory1 = CategoryModel(user: mockUser, name: "Cat 2");
    mockAccountSource =
        AccountModel(user: mockUser, name: "meu Nome", balance: 100000.0);
    mockAccountDestination =
        AccountModel(user: mockUser, name: "seu Nome", balance: 100000.0);
    mockTransactions.addAll([
      TransactionModel(
        user: mockUser,
        source: mockAccountSource,
        destination: mockAccountDestination,
        category: mockCategory2,
        date: DateTime.now(),
        value: 32,
        description: "um exemplo",
      ),
      TransactionModel(
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

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
