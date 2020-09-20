
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/repositories/transaction_repository.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'shared/repositories/session_repository.dart';
import 'shared/repositories/user_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind<dynamic>> get binds => <Bind<dynamic>>[
        // Repositories
        Bind<SessionRepository>((Inject<dynamic> i) => SessionRepository()),
        Bind<UserRepository>((Inject<dynamic> i) => UserRepository()),
        Bind<TransactionRepository>((i) => TransactionRepository()),

        // Controllers
        Bind<AppController>((Inject<dynamic> i) => AppController()),
      ];

  @override
  List<Router<dynamic>> get routers => <Router<dynamic>>[
        Router<LoginModule>(Modular.initialRoute, module: LoginModule()),
        Router<HomeModule>('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject<AppModule> get to => Inject<AppModule>.of();
}
