import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind<dynamic>> get binds => <Bind<dynamic>>[
        Bind<HomeController>((Inject<dynamic> i) => HomeController()),
      ];

  @override
  List<Router<dynamic>> get routers => [
        Router<HomePage>(Modular.initialRoute, child: (_, __) => const HomePage()),
      ];

  static Inject<HomeModule> get to => Inject<HomeModule>.of();
}
