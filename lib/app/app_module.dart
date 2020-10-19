import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/repositories/hive/account_repository_hive.dart';
import 'package:plano_b/app/shared/repositories/mock/account_repository_mock.dart';
import 'package:plano_b/app/shared/services/account_service.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/account/account_module.dart';
import 'modules/login/login_module.dart';
import 'modules/transactions/transactions_module.dart';
// import 'shared/repositories/hive/transaction_repository_hive.dart';
import 'shared/repositories/hive/user_repository_hive.dart';
import 'shared/repositories/mock/transaction_repository_mock.dart';
import 'shared/services/transaction_service.dart';
import 'shared/services/user_service.dart';
import 'shared/utils/routes_names_utils.dart';
// import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        // Repositories
        // Bind<UserRepositoryAbstract>(
        // (Inject<dynamic> i) => UserRepositoryHive(),
        // ),
        Bind<TransactionService>(
          (i) => TransactionService(transactionRepository: TransactionRepositoryMock()),
          // (i) => TransactionService(transactionRepository: TransactionRepositoryHive()),
        ),
        Bind<AccountService>(
          (i) => AccountService(accountRepository: AccountRepositoryMock()),
          // (i) => AccountService(accountRepository: AccountRepositoryHive()),
        ),
        Bind<UserService>(
          (i) => UserService(userRepository: UserRepositoryHive()),
        ),

        // Controllers
        Bind<AppController>((Inject<dynamic> i) => AppController()),

        //Stores
        Bind<LoggedUserStore>((Inject<dynamic> i) => LoggedUserStore()),

      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter<LoginModule>(Modular.initialRoute, module: LoginModule()),
        ModularRouter<TransactionsModule>(
          RouteNamesUtils.TRANSACTION_PAGE,
          module: TransactionsModule(),
        ),
        ModularRouter<AccountModule>(
          RouteNamesUtils.ACCOUNT_PAGE,
          module: AccountModule(),
        ),
      ];
}
