import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/account/account_controller.dart';
import 'package:plano_b/app/modules/account/account_page.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';

class AccountModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<AccountController>((Inject<dynamic> i) => AccountController()),
      ];

  @override
  List<ModularRouter> get routers => <ModularRouter>[
        ModularRouter<AccountPage>(
          RouteNamesUtils.ACCOUNT_PAGE,
          child: (_, __) => AccountPage(),
        ),
      ];
}
