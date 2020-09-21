import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String description;
  final String category;
  final double value;
  final DateTime date;
  final VoidCallback onTap;
  final Function(DismissDirection) onDismissed;

  TransactionCard({
    Key key,
    @required this.description,
    @required this.category,
    @required this.value,
    @required this.date,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 30)),
                Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.info_outline, size: 32),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          description.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              DateFormat('yMd').format(date) +
                                  ' - ' +
                                  category.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      Text(
                        'R\$ ' + value.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
