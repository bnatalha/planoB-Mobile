import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';

class AppMainDrawer extends StatefulWidget {
  @override
  _AppMainDrawerState createState() => _AppMainDrawerState();
}

class _AppMainDrawerState extends State<AppMainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Finances App',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          buildListTile('Contas de banco', RouteNamesUtils.ACCOUNT_PAGE),
          buildListTile('Transações', RouteNamesUtils.HOME_PAGE),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, String namedRoute) => ListTile(
        title: Text(title),
        onTap: () {
          Modular.link.pushNamed(namedRoute);
        },
      );

  List<Widget> get drawerItems {
    return _getAccounts;
  }

  List<Widget> get _getAccounts {
    List<String> bankNames = ['Nubank', 'Inter', 'Banco do Brasil'];

    return bankNames
        .map(
          (String name) => InkWell(
            onTap: () => print('Clicando na conta $name'),
            child: ListTile(
              leading: Icon(Icons.account_balance),
              title: Text(name),
            ),
          ),
        )
        .toList();
  }
}
