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

// TODO edit date

class TransactionDetailsPage extends StatefulWidget {
  static const namedRoute = '/transaction';
  const TransactionDetailsPage();
  @override
  _TransactionDetailsPageState createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState
    extends ModularState<TransactionDetailsPage, TransactionDetailsController> {
  TextEditingController _valueController;

  final Padding _downArrow =
      Padding(padding: EdgeInsets.all(4), child: Icon(Icons.south, size: 40));

  @override
  void initState() {
    _valueController = TextEditingController();
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

    // controller.verifyMode();

    super.initState();
  }

  @override
  void dispose() {
    _valueController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${idString()}"),
        actions: [
          Observer(builder: (_) {
            if (controller.isCreateTransactionMode) {
              return _saveButton;
            }
            return _editSwitch;
          })
        ],
      ),
      body: _body,
    );
  }

  Widget get _editSwitch => Row(
        children: [
          Icon(
            Icons.mode_edit,
            color: Colors.amber[200],
          ),
          SizedBox(width: 5),
          Text(controller.isEditTransactionMode
              ? ''
              : 'Modo Edição'), // TODO animar in-out
          Switch(
            value: controller.isEditTransactionMode,
            activeColor: Colors.amber[200],
            onChanged: (isExitingEditMode) {
              controller.toggleEditMode();
              print('edit_mode: ${controller.isEditTransactionMode}');
              if (!controller.isEditTransactionMode) {
                _saveTransaction();
              }
            },
          ),
        ],
      );

  Widget get _saveButton => IconButton(
        onPressed: _createTransaction,
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
      );

  Widget get _body => Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blueGrey.shade300,
              elevation: 12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _header,
                  SizedBox(height: 10),
                  _srcAccArea,
                  _downArrow,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _valueField,
                  ),
                  _downArrow,
                  _destAccArea
                  // buildButtons()
                ],
              ),
            ),
          ),
        ),
      );

  Widget get _header => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(3)),
          color: Colors.blueGrey.shade700,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                controller.isCreateTransactionMode ? "" : "#${idString()}",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              ),
            ),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                formattedDate(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      );

  Widget get _destAccArea => Observer(builder: (_) {
        if (controller.accounts != null && controller.accounts.isNotEmpty) {
          return buildAccArea(
            leadText: 'Destino:',
            onChanged: controller.setDestAccount,
            account: controller.destSelectedAccount,
          );
        }
        return Text('placeholder');
      });

  Widget get _srcAccArea => Observer(builder: (_) {
        if (controller.accounts != null && controller.accounts.isNotEmpty) {
          return buildAccArea(
            leadText: 'Origem:',
            onChanged: controller.setSrcAccount,
            account: controller.srcSelectedAccount,
          );
        }
        return Text('placeholder');
      });

  // TODO checar se valor > balanço na conta
  Widget get _valueField => Observer(
        builder: (_) => Row(
          children: [
            Icon(Icons.monetization_on),
            SizedBox(width: 4),
            Text('Valor: '),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Colors.blueGrey.shade500,
                  fontWeight: FontWeight.bold,
                ),
                enabled: !controller.isViewTransactionMode,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                controller: _valueController,
                decoration: InputDecoration(
                  prefixText: 'R\$ ',
                ),
              ),
            ),
          ],
        ),
      );

  String idString() {
    return "${!controller.isCreateTransactionMode ? controller.transaction.id : "Nova Transação"}";
  }

  String formattedDate() {
    if (controller.transaction.date != null) {
      // return 'Realizada em ${DateFormat('yMd HH:MM').format(controller.transaction.date)}';
      return '${DateFormat('d/M/y HH:MM').format(controller.transaction.date)}';
    }
    return '${DateFormat('d/M/y HH:MM').format(DateTime.now())}';
  }

  Widget buildAccArea({
    String leadText,
    Function onChanged,
    AccountModel account,
  }) {
    final DropdownButton<AccountModel> dropdownButton = DropdownButton(
      isExpanded: true,
      disabledHint: Text(account.name),
      value: controller.isViewTransactionMode ? null : account,
      items: controller.accounts
          .map((e) => DropdownMenuItem(child: Text(e.name), value: e))
          .toList(),
      onChanged: (AccountModel value) {
        onChanged(value);
      },
    );

    final selectionField = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leadText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Expanded(child: dropdownButton),
      ],
    );

    final accInfo = Container(
      width: double.infinity,
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Text('Usuário: ${account.user.name}'),
          Text('Saldo: ${account.balance}'),
        ],
      ),
    );

    return Card(
      color: Colors.blueGrey.shade100,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          children: [
            selectionField,
            accInfo,
          ],
        ),
      ),
    );
  }

  void _createTransaction() {
    controller.addTransaction(controller.transaction.copyWith(
      date: controller.transaction.date ?? DateTime.now(),
      value: double.parse(_valueController.value.text),
      source: controller.srcSelectedAccount,
      destination: controller.destSelectedAccount,
    ));

    Modular.link.pop();
  }

  void _saveTransaction() {
    controller.updateTransaction(controller.transaction.copyWith(
      date: controller.transaction.date ?? DateTime.now(),
      value: double.parse(_valueController.value.text),
      source: controller.srcSelectedAccount,
      destination: controller.destSelectedAccount,
    ));
  }
}
