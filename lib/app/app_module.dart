import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/account/account_module.dart';
import 'modules/login/login_module.dart';
import 'modules/transactions/transactions_module.dart';
import 'shared/repositories/abstract/transaction_repository_abstract.dart';
import 'shared/repositories/abstract/user_repository_abstract.dart';
import 'shared/repositories/hive/transaction_repository_hive.dart';
import 'shared/repositories/hive/user_repository_hive.dart';
import 'shared/utils/routes_names_utils.dart';
// import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        // Repositories
        Bind<UserRepositoryAbstract>(
            (Inject<dynamic> i) => UserRepositoryHive()),
        Bind<TransactionRepositoryAbstract>((i) => TransactionRepositoryHive()),

        // Controllers
        Bind<AppController>((Inject<dynamic> i) => AppController()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter<LoginModule>(Modular.initialRoute, module: LoginModule()),
        ModularRouter<TransactionsModule>(RouteNamesUtils.TRANSACTION_PAGE,
            module: TransactionsModule()),
        ModularRouter<AccountModule>(RouteNamesUtils.ACCOUNT_PAGE,
            module: AccountModule()),
      ];
}
