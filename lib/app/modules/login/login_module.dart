import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<LoginController>((Inject<dynamic> i) => LoginController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter<LoginPage>(
          Modular.initialRoute,
          child: (_, __) => const LoginPage(),
        ),
      ];
}
