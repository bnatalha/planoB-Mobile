import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/repositories/session_repository.dart';


part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  SessionRepository _sessionRepository = Modular.get();

  @computed
  String get firstName => _sessionRepository.currentLoggedUser.name;

  @computed
  String get lastName => _sessionRepository.currentLoggedUser.name;
}
