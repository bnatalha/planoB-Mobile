import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

class AccountCard extends StatelessWidget {
  final int id;
  final UserModel user;
  final String name;
  final double balance;
  final VoidCallback onTap;
  final Function(DismissDirection) onDismissed;

  const AccountCard({
    Key key,
    @required this.id,
    @required this.user,
    @required this.name,
    @required this.balance,
    this.onTap,
    this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Dismissible(
          direction: DismissDirection.endToStart,
          key: key,
          onDismissed: onDismissed ?? (_) {},
          background: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                ),
                Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          child: buildCard(context),
        ),
      ),
    );
  }

  Card buildCard(BuildContext context) {
    final neutralStyle = Theme.of(context).textTheme.subtitle1;
    final positiveStyle = neutralStyle.copyWith(color: Colors.green.shade700);
    final negativeStyle = neutralStyle.copyWith(color: Colors.red.shade700);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.account_balance, size: 32),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  // Row(
                  //   mainAxisSize: MainAxisSize.max,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: <Widget>[
                  //     Text(
                  //       DateFormat('yMd').format(date) +
                  //           ' - ' +
                  //           category.toString(),
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .caption
                  //           .copyWith(fontSize: 14),
                  //       overflow: TextOverflow.ellipsis,
                  //       maxLines: 1,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Column(
              children: [
                Text(
                  'R\$ ' + balance.toStringAsFixed(2),
                  style: balance > 0
                      ? positiveStyle
                      : (balance < 0 ? negativeStyle : neutralStyle),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
