import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/home/components/transaction_details/transaction_details_controller.dart';
import 'package:plano_b/app/modules/home/components/transaction_details/transaction_details_page.dart';
import 'package:plano_b/app/shared/repositories/transaction_repository.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind<dynamic>> get binds => <Bind<dynamic>>[
        Bind<HomeController>((Inject<dynamic> i) => HomeController()),
        Bind<TransactionDetailsController>((i) =>
            TransactionDetailsController(i.get<TransactionRepository>())),
      ];

  @override
  List<Router<dynamic>> get routers => [
        Router<HomePage>(Modular.initialRoute,
            child: (_, __) => const HomePage()),
        Router<TransactionDetailsPage>(Modular.initialRoute,
            child: (_, __) => const TransactionDetailsPage()),
      ];

  static Inject<HomeModule> get to => Inject<HomeModule>.of();
}
