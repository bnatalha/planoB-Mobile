import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/transactions/pages/transaction_details/transaction_details_controller.dart';
import 'package:plano_b/app/modules/transactions/stores/transaction_store.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';

import 'pages/transaction_details/transaction_details_page.dart';
import 'transactions_controller.dart';
import 'transactions_page.dart';


class TransactionsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Store
        Bind<TransactionStore>(
          (i) => TransactionStore(),
        ),
        // Controllers
        Bind<TransactionsController>(
          (i) => TransactionsController(
            i.get<TransactionStore>(),
          ),
        ),
        Bind<TransactionDetailsController>(
          (i) => TransactionDetailsController(
            i.get<TransactionStore>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter<TransactionsPage>(
          Modular.initialRoute,
          child: (_, __) => const TransactionsPage(),
        ),
        ModularRouter<TransactionDetailsPage>(
          RouteNamesUtils.DETAIL_ROUTE,
          child: (_, __) => const TransactionDetailsPage(),
        ),
      ];
}
