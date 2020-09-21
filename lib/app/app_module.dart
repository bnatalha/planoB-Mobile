import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/repositories/transaction/transaction_repository.dart';

import 'app_controller.dart';
import 'app_widget.dart';
// import 'modules/login/login_module.dart';
import 'modules/transactions/transactions_module.dart';
import 'shared/repositories/session/session_repository.dart';
import 'shared/repositories/session/session_repository_interface.dart';
import 'shared/repositories/session/session_repository_mock.dart';
import 'shared/repositories/transaction/transaction_repository_interface.dart';
import 'shared/repositories/transaction/transaction_repository_mock.dart';
import 'shared/repositories/user/user_repository.dart';
import 'shared/repositories/user/user_repository_interface.dart';
import 'shared/repositories/user/user_repository_mock.dart';

// class AppModule extends MainModule {
//   static const bool IS_MOCK = true;

//   @override
//   List<Bind<dynamic>> get binds => <Bind<dynamic>>[
//         // Repositories
//         Bind<ISessionRepository>((Inject<dynamic> i) =>
//             IS_MOCK ? SessionRepositoryMock() : SessionRepository()),
//         Bind<IUserRepository>((Inject<dynamic> i) =>
//             IS_MOCK ? UserRepositoryMock() : UserRepository()),
//         Bind<ITransactionRepository>((i) =>
//             IS_MOCK ? TransactionRepositoryMock() : TransactionRepository()),

//         // Controllers
//         Bind<AppController>((Inject<dynamic> i) => AppController()),
//       ];

//   @override
//   List<Router<dynamic>> get routers => <Router<dynamic>>[
//         // Router<LoginModule>(Modular.initialRoute, module: LoginModule()),
//         // Router<HomeModule>('/home', module: HomeModule()),
//         Router<TransactionsModule>(Modular.initialRoute,
//             module: TransactionsModule()),
//       ];

//   @override
//   Widget get bootstrap => AppWidget();

//   static Inject<AppModule> get to => Inject<AppModule>.of();
// }

class AppModule extends MainModule {
  static const bool IS_MOCK = true;

  @override
  List<Bind> get binds => [
        // Repositories
        Bind<ISessionRepository>((Inject<dynamic> i) =>
            IS_MOCK ? SessionRepositoryMock() : SessionRepository()),
        Bind<IUserRepository>((Inject<dynamic> i) =>
            IS_MOCK ? UserRepositoryMock() : UserRepository()),
        Bind<ITransactionRepository>((i) =>
            IS_MOCK ? TransactionRepositoryMock() : TransactionRepository()),

        // Controllers
        Bind<AppController>((Inject<dynamic> i) => AppController()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter<TransactionsModule>(Modular.initialRoute,
            module: TransactionsModule()),
      ];
}
