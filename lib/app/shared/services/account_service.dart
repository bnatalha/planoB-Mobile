import 'package:flutter/foundation.dart';
import 'package:plano_b/app/shared/repositories/abstract/account_repository_abstract.dart';

class AccountService {
  final AccountRepositoryAbstract accountRepository;

  AccountService({@required this.accountRepository})
      : assert(accountRepository != null);
}
