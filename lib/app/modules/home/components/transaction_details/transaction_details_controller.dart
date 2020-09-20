import 'package:mobx/mobx.dart';
import 'package:plano_b/app/shared/models/transaction_model.dart';
import 'package:plano_b/app/shared/repositories/transaction_repository.dart';
part 'transaction_details_controller.g.dart';

class TransactionDetailsController = _TransacionDetailsControllerBase
    with _$TransactionDetailsController;

abstract class _TransacionDetailsControllerBase with Store {
  final TransactionRepository repository;

  @observable
  ObservableFuture<List<TransactionModel>> transactions;

  @computed
  int get transactionsCount => transactions.value.length;

  _TransacionDetailsControllerBase(this.repository){
    fetchTransactions();
  }

  @action
  fetchTransactions() {
    transactions = repository.fetchTransactionsForCurrentUser().asObservable();
  }

  @action
  String addTransaction(TransactionModel model){
    repository.addTransaction(model);
    fetchTransactions();
  }
}
