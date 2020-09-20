import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/home/components/transaction_details/transaction_details_controller.dart';

import 'components/add_floating_button_widget.dart';

class TransactionDetailsPage extends StatefulWidget {
  const TransactionDetailsPage();
  @override
  _TransactionDetailsPageState createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState
    extends ModularState<TransactionDetailsPage, TransactionDetailsController> {
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
              itemCount: controller.transactionsCount,
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
      floatingActionButton: AddFloatingButton(),
    );
  }
}

