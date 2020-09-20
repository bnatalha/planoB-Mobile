import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';
import 'transactions_controller.dart';

class TransactionsPage extends StatefulWidget {
  final String title;
  const TransactionsPage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ModularState<TransactionsPage, TransactionsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transações"),
      ),
      body: Center(
        child: Observer(builder: (_) {
          if (controller.transactions.value == null) {
            return CircularProgressIndicator();
          }
          return ListView.separated(
              itemCount: controller.transactionsLength,
              separatorBuilder: (_, i) => Divider(),
              itemBuilder: (_, i) {
                final t = controller.transactions.value[i];
                return ListTile(
                  title: Text(t.date.toString()),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('From: ' + t.source.name),
                      Text('To: ' + t.destination.name),
                    ],
                  ),
                );
              });
        }),
      ),
      // TODO form for modifying transaction
      floatingActionButton: FloatingActionButton(onPressed: () {
        Modular.link.pushNamed(RouteNamesUtils.TRANSACTION_PAGE);
      }),
    );
  }
}
