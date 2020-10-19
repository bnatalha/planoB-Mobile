import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';

class AppMainDrawer extends StatefulWidget {
  @override
  _AppMainDrawerState createState() => _AppMainDrawerState();
}

class _AppMainDrawerState extends State<AppMainDrawer> {
  final LoggedUserStore _store = Modular.get();
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
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    'Finances App',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black26,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Bem vindo, ${_store.currentUser.value.name}!',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          buildListTile('Contas de banco', RouteNamesUtils.ACCOUNT_PAGE, Icons.list_alt),
          buildListTile('Transações', RouteNamesUtils.HOME_PAGE, Icons.monetization_on),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, String namedRoute, IconData iconData) => ListTile(
        title: Text(title),
        leading: Icon(iconData),
        onTap: () {
          Modular.to.pushReplacementNamed(namedRoute);
        },
      );
}
