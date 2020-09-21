import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

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
                  child: Text(
                      'Realizada em ${DateFormat('yMd').format(controller.transaction.date)}',
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
                buildaAccDescription(
                    context, "Origem", controller.transaction.source),
                // style: Theme.of(context).textTheme.headline6),
                buildaAccDescription(
                    context, "Destino", controller.transaction.destination),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      buildOutlineButton(
                        color: Colors.amber[200],
                        iconData: Icons.edit,
                        title: 'Editar',
                        onPress: () {},
                      ),
                      Spacer(),
                      buildOutlineButton(
                        color: Colors.red,
                        iconData: Icons.remove_circle_outline,
                        title: 'Remover',
                        onPress: () {},
                      ),
                      SizedBox(width: 10),
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

  OutlineButton buildOutlineButton(
      {Color color, IconData iconData, String title, Function onPress}) {
    return OutlineButton(
        child: Row(
          children: [
            Icon(
              iconData,
              size: 40,
              color: color,
            ),
            SizedBox(width: 10),
            Text(title, style: Theme.of(context).textTheme.subtitle1,),
          ],
        ),
        onPressed: onPress);
  }

  // TODO show account balance
  Widget buildaAccDescription(
      BuildContext context, String lead, AccountModel acc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$lead',
                style: Theme.of(context).textTheme.headline5,
              ),
              Divider(),
              // SizedBox(width: 5),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  Text('Usuario: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16, color: Colors.grey)),
                  Spacer(),
                  Text('${acc.user.name}',
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.local_atm,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  Text('Banco: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16, color: Colors.grey)),
                  Spacer(),
                  Text('${acc.name}',
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
