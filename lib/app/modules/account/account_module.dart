import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/account/pages/account_details/account_details_page.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';

import 'account_controller.dart';
import 'account_page.dart';
import 'pages/account_details/account_details_controller.dart';
import 'stores/account_store.dart';

class AccountModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<AccountStore>(
          (Inject<dynamic> i) => AccountStore(),
        ),
        Bind<AccountController>(
          (Inject<dynamic> i) => AccountController(
            i.get<AccountStore>(),
          ),
        ),
        Bind<AccountDetailsController>(
          (Inject<dynamic> i) => AccountDetailsController(
            i.get<AccountStore>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => <ModularRouter>[
        ModularRouter<AccountPage>(
          Modular.initialRoute,
          child: (_, __) => AccountPage(),
        ),
        ModularRouter<AccountDetailsPage>(
          RouteNamesUtils.DETAIL_ROUTE,
          child: (_, __) => AccountDetailsPage(),
        ),
      ];
}
