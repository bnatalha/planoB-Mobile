import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

// =============================================== USER
final UserModel userMock1 = UserModel(
  id: 1,
  login: 'mockuser1',
);

final List<UserModel> userMockList = <UserModel>[userMock1];

// =============================================== Account

final AccountModel accMock1 = AccountModel(
  id: 1,
  balance: 1000,
  name: 'nubank',
  user: userMock1,
);

final AccountModel accMock2 = AccountModel(
  id: 2,
  balance: 2222,
  name: 'Banco do Brasil',
  user: userMock1,
);

final List<AccountModel> accMockList = <AccountModel>[accMock1, accMock2];

// =============================================== Transaction

final TransactionModel transMock1 = TransactionModel(
  id: 1,
  user: userMock1,
  sourceAccountId: accMock1,
  destinationAccountId: accMock2,
  category: CategoryModel.transaction,
  date: DateTime.now(),
  value: 110.0,
  description: 'Sem descrição 1',
);

final TransactionModel transMock2 = TransactionModel(
  id: 2,
  user: userMock1,
  sourceAccountId: accMock2,
  destinationAccountId: accMock1,
  category: CategoryModel.transaction,
  date: DateTime.now(),
  value: 451.0,
  description: 'Sem descrição 2',
);

final TransactionModel transMock3 = TransactionModel(
  id: 3,
  user: userMock1,
  sourceAccountId: accMock2,
  destinationAccountId: accMock1,
  category: CategoryModel.transaction,
  date: DateTime.now(),
  value: 22.0,
  description: 'Sem descrição 3',
);

final List<TransactionModel> transMockList = <TransactionModel>[
  transMock1,
  transMock2,
  transMock3
];
