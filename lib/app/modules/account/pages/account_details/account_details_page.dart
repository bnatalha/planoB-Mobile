import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/account/pages/account_details/account_details_controller.dart';

class AccountDetailsPage extends StatefulWidget {
  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState
    extends ModularState<AccountDetailsPage, AccountDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Conta ${controller.account?.name ?? 'Nova Conta'}')),
      body: _body,
    );
  }

  Widget get _body => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _userField,
                  Card(
                    margin: EdgeInsets.all(14),
                    color: Colors.blueGrey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          _accNameField,
                          _accBalanceField,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.blueGrey.shade600,
                      child: _transactionList,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // Widget get _userField => TextField(
  //       decoration: InputDecoration(
  //         hintText: controller.account?.user?.name ?? 'nome',
  //         prefixIcon: Icon(Icons.person),
  //       ),
  //     );

  Widget get _userField => Padding(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
        child: Row(
          children: [
            Icon(Icons.person),
            SizedBox(
              width: 10,
            ),
            Text(
              controller.account?.user?.name ?? 'nome',
            )
          ],
        ),
      );

  Widget get _accNameField => TextField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Nome da conta',
          hintText: controller.account?.name ?? 'Insira o nome da conta',
        ),
      );

  Widget get _accBalanceField => TextField(
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Saldo',
          hintText: controller.account?.balance?.toStringAsFixed(2) ?? '10.0',
        ),
      );

  Widget get _transactionList => Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Text(
          'Lista de transações associadas em breve.',
          style: TextStyle(color: Colors.white),
        ),
      );
}
