import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/abstract/account_repository_abstract.dart';
import 'package:plano_b/app/shared/services/transaction_service.dart';

class AccountService {
  final AccountRepositoryAbstract accountRepository;
  final TransactionService transactionService;

  AccountService({
    @required this.accountRepository,
    @required this.transactionService,
  })  : assert(accountRepository != null),
        assert(transactionService != null);

  Future<bool> createAccount({int userId, String bankName}) async {
    return await accountRepository.createAccount(userId, bankName);
  }

  Future<bool> deleteAccount({int accountId}) async {
    return await accountRepository.deleteAccount(accountId);
  }

  Future<List<AccountModel>> getAccountsOfUser({int userId}) async {
    final jsonList = await accountRepository.getAccountsFromUserId(userId);

    List<AccountModel> accounts = jsonList.map((e) => AccountModel.fromJson(e)).toList();
    final List<AccountModel> finalAccounts = <AccountModel>[];

    for (AccountModel account in accounts) {
      finalAccounts.add(
        account.copyWith(
            balance: (await getAccount(accountId: account.id)).balance),
      );
    }

    return finalAccounts;
  }

  Future<AccountModel> getAccount({int accountId}) async {
    final json = await accountRepository.getAccountFromId(accountId);
    List<TransactionModel> transactionsFromAccount = await transactionService
        .getTransactionsFromAccount(accountId: accountId);

    double balance = 0;
    transactionsFromAccount.forEach((TransactionModel t) {
      if (t.source.id == accountId) {
        balance -= t.value;
      } else if (t.destination.id == accountId) {
        balance += t.value;
      }
    });

    print('sum balance of account $accountId: $balance');

    return AccountModel.fromJson(json).copyWith(balance: balance);
  }
}
