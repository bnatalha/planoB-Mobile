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
        actions: [
          IconButton(
              icon: Icon(Icons.sync),
              onPressed: () {
                controller.fetchTransactions();
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Finances App',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
            ..._getAccounts(controller),
          ],
        ),
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
                  key: ValueKey(t.id),
                  description: t.description,
                  category: t.category.name,
                  value: t.value,
                  date: t.date,
                  onTap: () {
                    controller.selectTransaction(t);
                    Modular.link.pushNamed(RouteNamesUtils.TRANSACTION_PAGE);
                  },
                  onDismissed: (_) => controller.removeTransaction(t),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.link.pushNamed(RouteNamesUtils.TRANSACTION_PAGE);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _getAccounts(TransactionsController controller) {
    List<String> bankNames = ['Nubank', 'Inter', 'Banco do Brasil'];

    return bankNames
        .map(
          (String name) => InkWell(
            onTap: () => print('Clicando na conta $name'),
            child: ListTile(
              leading: Icon(Icons.account_balance),
              title: Text(name),
            ),
          ),
        )
        .toList();
  }
}
