import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';

import 'login_controller.dart';
import 'login_page.dart';

// class LoginModule extends ChildModule {
//   @override
//   List<Bind<dynamic>> get binds => <Bind<dynamic>>[
//         Bind<LoginController>((Inject<dynamic> i) => LoginController()),
//       ];

//   @override
//   List<Router<dynamic>> get routers => [
//         Router<LoginPage>(Modular.initialRoute, child: (_, __) => const LoginPage()),
//       ];

//   static Inject<LoginModule> get to => Inject<LoginModule>.of();
// }

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<LoginController>((Inject<dynamic> i) => LoginController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter<LoginPage>(Modular.initialRoute,
            child: (_, __) => const LoginPage()),
      ];
}
