import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';
import 'transactions_controller.dart';
import '../../shared/widgets/transaction_card.dart';

class TransactionsPage extends StatefulWidget {
  final String title;
  const TransactionsPage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState
    extends ModularState<TransactionsPage, TransactionsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transações"),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            if (controller.transactions.value == null) {
              return CircularProgressIndicator();
            }
            return ListView.separated(
              itemCount: controller.transactionsLength,
              separatorBuilder: (_, i) => const SizedBox(height: 4),
              itemBuilder: (_, i) {
                final t = controller.transactions.value[i];
                return TransactionCard(
                  description: t.description,
                  category: t.category.toString(),
                  value: t.value,
                  date: t.date,
                  onTap: () => print("Clicado na transacao ${t.description}"),
                );
              },
            );
          },
        ),
      ),
      // TODO form for modifying transaction
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.link.pushNamed(RouteNamesUtils.TRANSACTION_PAGE);
        },
      ),
    );
  }
}
