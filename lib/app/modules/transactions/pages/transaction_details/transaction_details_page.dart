import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:plano_b/app/modules/login/login_controller.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

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
    _srcUserController = TextEditingController();
    _srcBankController = TextEditingController();
    _destUserController = TextEditingController();
    _destBankController = TextEditingController();

    // TODO: Adapt to consume from new model
    /*
    if (controller.transaction.id != null) {
      _valueController.value =
          TextEditingValue(text: controller.transaction.value.toString());
      _srcUserController.value = TextEditingValue(
          text: controller.transaction.source.user.name.toString());
      _srcBankController.value =
          TextEditingValue(text: controller.transaction.source.name.toString());
      _destUserController.value = TextEditingValue(
          text: controller.transaction.destination.user.name.toString());
      _destBankController.value = TextEditingValue(
          text: controller.transaction.destination.name.toString());
    }
    */

    controller.verifyMode();

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
        title: Text("${idString()}"),
        actions: [
          Observer(builder: (_) {
            if (controller.addTransactionMode) {
              return IconButton(
                onPressed: _addTransaction,
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              );
            }

            return Row(
              children: [
                Icon(
                  Icons.mode_edit,
                  color: Colors.amber[200],
                ),
                SizedBox(width: 5),
                Text(
                  controller.editMode ? '' : 'Modo Edição',
                ), // TODO animar in-out
                Switch(
                  value: controller.editMode,
                  activeColor: Colors.amber[200],
                  onChanged: (isExitingEditMode) {
                    controller.toggleEditMode();
                    print('edit_mode: ${controller.editMode}');
                    if (!controller.editMode) {
                      _saveTransaction();
                    }
                  },
                ),
              ],
            );
          })
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
                      formattedDate(),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          controller.addTransactionMode ? "" : "#${idString()}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Spacer(),
                        Expanded(
                          child: Observer(
                            builder: (_) => TextField(
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              enabled: controller.editMode,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
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
                  // buildaAccDescription(
                  //   acc: controller.transaction
                  //       .source, // TODO: Change to new model :: controller.transaction.source,
                  //   lead: 'Origem',
                  //   userController: _srcUserController,
                  //   bankController: _srcBankController,
                  // ),
                  buildAccTile(lead: 'Origem'),
                  SizedBox(height: 10),
                  // buildaAccDescription(
                  //   acc: controller.transaction
                  //       .destination, // TODO: Change to new model :: controller.transaction.destination,
                  //   lead: 'Destino',
                  //   userController: _destUserController,
                  //   bankController: _destBankController,
                  // ),
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

  String idString() =>
      "${!controller.addTransactionMode ? controller.transaction.id : "Nova Transação"}";

  String formattedDate() {
    // TODO: Change to new format
    // return 'NULL';
    // /*
    if (controller.transaction.date != null) {
      return ' Realizada em ${DateFormat('yMd').format(controller.transaction.date)}';
    }

    return ' Nova transação (${DateFormat('yMd').format(DateTime.now())})';
    // */
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
              enabled: controller.editMode,
              style: inputTextStyle,
              controller: userController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Usuário',
              ),
            ),
          ),
          Observer(
            builder: (_) => TextField(
              enabled: controller.editMode,
              style: inputTextStyle,
              controller: bankController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.local_atm),
                labelText: 'Banco',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccTile({
    String lead,
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
          // Observer(
          //   builder: (_) => TextField(
          //     enabled: controller.editMode,
          //     style: inputTextStyle,
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(Icons.person),
          //       labelText: 'Usuário',
          //     ),
          //   ),
          // ),
          Observer(
            builder: (_) => TextField(
              enabled: false,
              style: inputTextStyle,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                // labelText: 'Usuário',
                hintText: controller.getCurrentLoggedUser().name
              ),
            ),
          ),
          Observer(builder: (_) {
            if (controller.accounts != null &&
                controller.accounts.isNotEmpty) {
              return DropdownButton(
                value: controller.srcSelectedAccount,
                  items: controller.accounts
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (AccountModel value) {
                    controller.setSrcAccount(value);
                  });
            }

            return Text('placeholder');

            // final tf = TextField(
            //   enabled: controller.editMode,
            //   style: inputTextStyle,
            //   decoration: InputDecoration(
            //     prefixIcon: Icon(Icons.local_atm),
            //     labelText: 'Banco',
            //   ),
            // );
          }),
        ],
      ),
    );
  }

  void _addTransaction() {
    final LoginController loginController = Modular.get();
    // UserModel muser = UserModel(
    // name: _srcUserController.value.text,
    // login: 'qlqr coisa',
    // password: 'meudeus',
    // );
    UserModel muser = loginController.currentUser;

    AccountModel srcAcc = AccountModel(
      name: _srcBankController.value.text,
      user: muser,
      balance: 3000, // TODO: Put real balance
    );

    AccountModel destAcc = AccountModel(
      name: _destBankController.value.text,
      user: UserModel(
        login: 'outra coisa',
        name: _destUserController.value.text,
      ),
      balance: 2000,
    );

    controller.addTransaction(TransactionModel(
      user: muser,
      source: srcAcc,
      destination: destAcc,
      category: CategoryModel.deposit,
      date: controller.transaction.date ?? DateTime.now(),
      value: double.parse(_valueController.value.text),
      description: "Nova transacao",
    ));

    Modular.link.pop();
  }

  void _saveTransaction() {
    controller.transaction = _buildNewTransaction();
  }

  TransactionModel _buildNewTransaction() {
    /*
    return controller.transaction.copyWith(
      date: controller.transaction.date ?? DateTime.now(),
      value: double.parse(_valueController.value.text),
      source: controller.transaction.source.copyWith(
        name: _srcBankController.value.text,
        user: controller.transaction.source.user.copyWith(
          name: _srcUserController.value.text,
        ),
      ),
      destination: controller.transaction.destination.copyWith(
        name: _destBankController.value.text,
        user: controller.transaction.destination.user.copyWith(
          name: _destUserController.value.text,
        ),
      ),
    );
    */
  }
}
