import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/account/account_controller.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';
import 'package:plano_b/app/shared/widgets/account_card.dart';
import 'package:plano_b/app/shared/widgets/app_main_drawer.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends ModularState<AccountPage, AccountController> {
  @override
  void initState() {
    // controller.fetchAccounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contas'),
        actions: [
          IconButton(
              icon: Icon(Icons.sync),
              onPressed: () {
                controller.fetchAccounts();
              })
        ],
      ),
      drawer: AppMainDrawer(),
      body: RefreshIndicator(
        onRefresh: controller.fetchAccounts,
        child: Container(
          height: MediaQuery.of(context).size.height * .7,
          alignment: Alignment.center,
          child: Observer(
            builder: (_) {
              if (controller?.accountsList == null ||
                  controller.accountsList.isEmpty == null) {
                return Container(
                  child: Text('Nenhuma conta cadastrada.'),
                );
              }
              return ListView.builder(
                itemCount: controller.accountsList.length,
                itemBuilder: (_, i) {
                  final item = controller.accountsList[i];
                  return AccountCard(
                    key: ValueKey(item.id),
                    id: item.id,
                    balance: item.balance,
                    name: item.name,
                    user: item.user,
                    onTap: () {
                      controller.account.setAccount(item);
                      Modular.to.pushNamed(RouteNamesUtils.ACCOUNT_DETAIL_PAGE);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
