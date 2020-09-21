import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/models/account_model.dart';
import 'transaction_details_controller.dart';

class TransactionDetailsPage extends StatefulWidget {
  static const namedRoute = '/transaction';
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
        title: Text("${controller.transaction.id}"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Realizada em ${controller.transaction.date}',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('#${controller.transaction.id}',
                        style: Theme.of(context).textTheme.headline4),
                    // Spacer(),
                    Text('R\$${controller.transaction.value}',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ],
                ),
                SizedBox(height: 20),
                buildaAccDescriptionRow(
                    context, "From", controller.transaction.source),
                // style: Theme.of(context).textTheme.headline6),
                buildaAccDescriptionRow(
                    context, "To", controller.transaction.destination),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 40,
                          ),
                          onPressed: () {}),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.remove_circle, size: 40),
                          onPressed: () {}),
                      SizedBox(width: 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildaAccDescriptionRow(
      BuildContext context, String lead, AccountModel acc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$lead: ',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(width: 5),
        Text(
          '${acc.user.name}',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.lightBlueAccent),
        ),
        SizedBox(width: 5),
        Text('at', style: Theme.of(context).textTheme.headline6),
        SizedBox(width: 5),
        Text(
          '${acc.name}',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.blue),
        ),
      ],
    );
  }
}
