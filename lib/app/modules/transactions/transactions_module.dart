import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/transactions/pages/transaction_details/transaction_details_controller.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/services/transaction_service.dart';
// import 'package:plano_b/app/shared/repositories/session/session_repository_interface.dart';
// import 'package:plano_b/app/shared/repositories/transaction/transaction_repository_interface.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';

// import '../../shared/repositories/transaction/transaction_repository.dart';
import 'pages/transaction_details/transaction_details_page.dart';
import 'transactions_controller.dart';
import 'transactions_page.dart';

// class TransactionsModule extends ChildModule {
//   @override
//   List<Bind<dynamic>> get binds => <Bind<dynamic>>[
//         // Store
//         Bind<TransactionStore>(
//           (i) => TransactionStore(),
//         ),
//         // Controllers
//         Bind<TransactionsController>(
//           (i) => TransactionsController(
//             i.get<ISessionRepository>(),
//             // i.get<ITransactionRepository>(),
//             i.get<TransactionStore>(),
//           ),
//         ),
//         Bind<TransactionDetailsController>(
//           (i) => TransactionDetailsController(
//             // i.get<ITransactionRepository>(),
//             i.get<TransactionStore>(),
//           ),
//         ),
//       ];

//   @override
//   List<Router<dynamic>> get routers => [
//         Router<TransactionsPage>(RouteNamesUtils.HOME_PAGE,
//             child: (_, __) => const TransactionsPage()),
//         Router<TransactionDetailsPage>(RouteNamesUtils.TRANSACTION_PAGE,
//             child: (_, __) => const TransactionDetailsPage()),
//       ];

//   static Inject<TransactionsModule> get to => Inject<TransactionsModule>.of();
// }

class TransactionsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind<TransactionService>(
        //   (i) => TransactionService(),
        // ),
        // Store
        Bind<TransactionStore>(
          (i) => TransactionStore(),
        ),
        // Controllers
        Bind<TransactionsController>(
          (i) => TransactionsController(
            // i.get<ISessionRepository>(),
            // i.get<ITransactionRepository>(),
            i.get<TransactionStore>(),
          ),
        ),
        Bind<TransactionDetailsController>(
          (i) => TransactionDetailsController(
            // i.get<ITransactionRepository>(),
            i.get<TransactionStore>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter<TransactionsPage>(Modular.initialRoute,
            child: (_, __) => const TransactionsPage()),
        ModularRouter<TransactionDetailsPage>(RouteNamesUtils.DETAIL_ROUTE,
            child: (_, __) => const TransactionDetailsPage()),
      ];
}
