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
    final acc = controller.account;
    return Scaffold(
      appBar: AppBar(title: Text('Conta ${acc?.name ?? 'nome'}')),
      body: Center(
        child: Column(
          children: [
            Text(acc?.name ?? 'nome'),
            Text(acc?.balance?.toStringAsFixed(2) ?? '10.0'),
          ],
        ),
      ),
    );
  }
}
