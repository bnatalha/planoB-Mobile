import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:plano_b/app/shared/models/category_model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';
import 'package:plano_b/app/shared/utils/aux.dart';

import '../../../../shared/models/account_model.dart';
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
  MoneyMaskedTextController _valueController;
  TextEditingController _descriptionController;

  final Padding _downArrow = Padding(
    padding: EdgeInsets.all(4),
    child: Icon(Icons.south, size: 40),
  );

  @override
  void initState() {
    _valueController = MoneyMaskedTextController();
    _descriptionController = TextEditingController();

    if (controller.isCreateTransactionMode) {
      _valueController.value = TextEditingValue(text: '0.0');
    } else if (controller.isViewTransactionMode) {
      _valueController.value =
          TextEditingValue(text: '${controller.transaction.value}');
      _descriptionController.value =
          TextEditingValue(text: '${controller.transaction.description}');
    }

    super.initState();
  }

  @override
  void dispose() {
    _valueController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhamento"),
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
              : 'Editar'), // TODO animar in-out
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

  final GlobalKey formKey = GlobalKey<FormState>();

  Widget get _body => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _header,
                    _descriptionField,
                    _categoryField,
                    Observer(
                      builder: (_) => Card(
                        color: Colors.blueGrey.shade300,
                        elevation: 12,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              _valueField,
                              const SizedBox(height: 20),
                              if (controller.isViewTransactionMode)
                                Row(
                                  children: <Widget>[
                                    Expanded(child: _srcAccArea),
                                    Icon(Icons.arrow_forward_ios_rounded),
                                    Expanded(child: _destAccArea),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _header => Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(3)),
          border: Border(
              bottom: BorderSide(color: Colors.blueGrey.shade700, width: 2)),
          // color: Colors.blueGrey.shade200,
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
                    .copyWith(color: Colors.blueGrey),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Text(
                formattedDate(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.black38),
              ),
            ),
          ],
        ),
      );

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

  // TODO checar se valor > balanço na conta
  Widget get _valueField => Observer(
        builder: (_) => Padding(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (text) {
                    if (double.tryParse(transformValueToDouble(text)) >
                        controller.srcSelectedAccount.balance) {
                      return 'Valor execedeu o total da conta';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.right,
                  enabled: !controller.isViewTransactionMode,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  controller: _valueController,
                  decoration: InputDecoration(
                    prefixText: 'R\$ ',
                    prefixStyle: GoogleFonts.openSans(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                    alignLabelWithHint: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _categoryField => Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(Icons.merge_type),
              ),
              SizedBox(width: 4),
              Text('Categoria '),
              SizedBox(width: 10),
              Expanded(
                child: DropdownButton<CategoryModel>(
                  isExpanded: true,
                  disabledHint: Text(controller.category.asString()),
                  onChanged: controller.isViewTransactionMode
                      ? null
                      : (c) {
                          controller.category = c;
                        },
                  value: controller.category,
                  items: CategoryModel.values
                      .map((c) => DropdownMenuItem<CategoryModel>(
                            child: Text(c.asString()),
                            value: c,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _descriptionField => Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(Icons.description),
              ),
              SizedBox(width: 4),
              Text('Descrição '),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Colors.blueGrey.shade500,
                    fontWeight: FontWeight.bold,
                  ),
                  enabled: !controller.isViewTransactionMode,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Insira a Descrição',
                  ),
                ),
              ),
            ],
          ),
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
    Icon icon,
    String leadText,
    Function onChanged,
    AccountModel account,
  }) {
    final DropdownButton<AccountModel> accountName =
        DropdownButton<AccountModel>(
      isExpanded: true,
      disabledHint: Text(account.name),
      value: account,
      items: controller.accounts
          .map(
            (e) => DropdownMenuItem<AccountModel>(
              child: Text(e.name),
              value: e,
            ),
          )
          .toList(),
      onChanged: controller.isViewTransactionMode
          ? null
          : (AccountModel value) => onChanged(value),
    );

    final selectionField = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: accountName),
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

    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
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
      user: Modular.get<LoggedUserStore>().currentUser.value,
      date: controller.transaction.date ?? DateTime.now(),
      value: double.parse(transformValueToDouble(_valueController.value.text)),
      source: (controller.category == CategoryModel.deposit)
          ? voidAccount
          : controller.srcSelectedAccount,
      destination: (controller.category == CategoryModel.withdrawal)
          ? voidAccount
          : controller.destSelectedAccount,
      description: _descriptionController.value.text.isEmpty
          ? "Sem Descrição"
          : _descriptionController.value.text,
      category: controller.category,
    ));

    Modular.link.pop();
  }

  void _saveTransaction() {
    controller.updateTransaction(controller.transaction.copyWith(
      user: Modular.get<LoggedUserStore>().currentUser.value,
      date: controller.transaction.date ?? DateTime.now(),
      value: double.parse(transformValueToDouble(_valueController.value.text)),
      source: (controller.category == CategoryModel.deposit)
          ? voidAccount
          : controller.srcSelectedAccount,
      destination: (controller.category == CategoryModel.withdrawal)
          ? voidAccount
          : controller.destSelectedAccount,
      description: _descriptionController.value.text.isEmpty
          ? "Sem Descrição"
          : _descriptionController.value.text,
      category: controller.category,
    ));
  }

  final voidAccount = AccountModel(
    id: -1,
    name: '',
    balance: 0.0,
    user: UserModel(
      id: -1,
      name: '',
      login: '',
      password: '',
    ),
  );
}
