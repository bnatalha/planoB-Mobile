import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/account/account_controller.dart';
import 'package:plano_b/app/shared/widgets/app_main_drawer.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends ModularState<AccountPage, AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contas'),
      ),
      drawer: AppMainDrawer(),
      body: RefreshIndicator(
        onRefresh: controller.updateAccounts,
        child: Container(
          height: MediaQuery.of(context).size.height * .7,
          alignment: Alignment.center,
          child: Observer(
            builder: (_) => ListView.builder(
              itemCount: controller.accountsList.length,
              itemBuilder: (_, i) {
                final item = controller.accountsList[i];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('R\$${item.balance.toStringAsFixed(2)}'),
                  onTap: () {},
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
