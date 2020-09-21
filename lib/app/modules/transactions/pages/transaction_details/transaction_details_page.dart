import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../../shared/models/account_model.dart';
import '../../../../shared/models/transaction_model.dart';
import 'transaction_details_controller.dart';

class TransactionDetailsPage extends StatefulWidget {
  static const namedRoute = '/transaction';
  const TransactionDetailsPage();
  @override
  _TransactionDetailsPageState createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState
    extends ModularState<TransactionDetailsPage, TransactionDetailsController> {
  TextEditingController _valueController;
  TextEditingController _srcUserController;
  TextEditingController _srcBankController;
  TextEditingController _destUserController;
  TextEditingController _destBankController;

  @override
  void initState() {
    _valueController = TextEditingController();
    _valueController.value =
        TextEditingValue(text: controller.transaction.value.toString());
    _srcUserController = TextEditingController();
    _srcUserController.value = TextEditingValue(
        text: controller.transaction.source.user.name.toString());
    _srcBankController = TextEditingController();
    _srcBankController.value =
        TextEditingValue(text: controller.transaction.source.name.toString());
    _destUserController = TextEditingController();
    _destUserController.value = TextEditingValue(
        text: controller.transaction.destination.user.name.toString());
    _destBankController = TextEditingController();
    _destBankController.value = TextEditingValue(
        text: controller.transaction.destination.name.toString());

    super.initState();
  }

  @override
  void dispose() {
    _valueController.dispose();

    _srcUserController.dispose();
    _srcBankController.dispose();
    _destUserController.dispose();
    _destBankController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.transaction.id}"),
        actions: [
          Observer(
            builder: (_) => Row(
              children: [
                Icon(
                  Icons.mode_edit,
                  color: Colors.amber[200],
                ),
                SizedBox(width: 5),
                Text(controller.enableEdit
                    ? ''
                    : 'Modo Edição'), // TODO animar in-out
                Switch(
                  value: controller.enableEdit,
                  activeColor: Colors.amber[200],
                  onChanged: (isExitingEditMode) {
                    controller.toggleEditMode();
                    print('edit_mode: ${controller.enableEdit}');
                    if (!controller.enableEdit) {
                      _saveTransaction();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('#${controller.transaction.id}',
                            style: Theme.of(context).textTheme.headline4),
                        Spacer(),
                        Expanded(
                          child: Observer(
                            builder: (_) => TextField(
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              enabled: controller.enableEdit,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              controller: _valueController,
                              decoration: InputDecoration(
                                prefixText: 'R\$',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  buildaAccDescription(
                    acc: controller.transaction.source,
                    lead: 'Origem',
                    userController: _srcUserController,
                    bankController: _srcBankController,
                  ),
                  SizedBox(height: 10),
                  buildaAccDescription(
                    acc: controller.transaction.destination,
                    lead: 'Destino',
                    userController: _destUserController,
                    bankController: _destBankController,
                  ),
                  SizedBox(height: 20),
                  // buildButtons()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // TODO show account balance
  Widget buildaAccDescription({
    String lead,
    AccountModel acc,
    TextEditingController userController,
    TextEditingController bankController,
  }) {
    TextStyle inputTextStyle = TextStyle(
      color: Colors.blue,
      fontSize: 18,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$lead',
            style: Theme.of(context).textTheme.headline5,
          ),
          Divider(),
          // SizedBox(width: 5),
          Observer(
            builder: (_) => TextField(
              enabled: controller.enableEdit,
              style: inputTextStyle,
              controller: userController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), labelText: 'Usuário'),
            ),
          ),
          Observer(
            builder: (_) => TextField(
              enabled: controller.enableEdit,
              style: inputTextStyle,
              controller: bankController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_atm), labelText: 'Banco'),
            ),
          ),
        ],
      ),
    );
  }

  void _saveTransaction() {
    controller.transaction = controller.transaction.copyWith(
      value: double.parse(_valueController.value.text),
      source: controller.transaction.source.copyWith(
        name: _srcUserController.value.text,
        user: controller.transaction.source.user.copyWith(
          name: _srcBankController.value.text,
        ),
      ),
      destination: controller.transaction.destination.copyWith(
        name: _destUserController.value.text,
        user: controller.transaction.destination.user.copyWith(
          name: _destBankController.value.text,
        ),
      ),
    );
  }
}
