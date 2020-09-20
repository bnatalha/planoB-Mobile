import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/repositories/transaction/transaction_repository_interface.dart';
part 'transaction_details_controller.g.dart';

class TransactionDetailsController = _TransacionDetailsControllerBase
    with _$TransactionDetailsController;

abstract class _TransacionDetailsControllerBase with Store {
  final ITransactionRepository repository;

  _TransacionDetailsControllerBase(this.repository) {}

  String get title => 'title';
}
