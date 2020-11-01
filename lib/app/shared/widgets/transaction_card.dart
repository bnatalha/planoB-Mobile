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
                  _categoryIcon(context),
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
                            _date(context),
                            // SizedBox(width: 8),
                            // _category(context)
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

  Widget _date(BuildContext context) {
    String text = 'Sem data';
    if (date != null) {
      final notThisYear = date.isBefore(DateTime(DateTime.now().year));
      text = DateFormat(notThisYear ? 'MMM, dd y HH:mm' : 'MMM, dd HH:mm')
          .format(date);
    }

    return Text(
      text,
      style: Theme.of(context).textTheme.caption.copyWith(fontSize: 12),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  _categoryIcon(BuildContext context) {
    // return Icon(Icons.info_outline, size: 32);
    final String character =
        category?.substring(0, 1)?.toUpperCase() ?? 'Sem Categ.';
    Color color = Colors.black;
    TextStyle style = Theme.of(context).textTheme.caption.copyWith(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: color,
        );

    if (character == 'D') {
      color = Colors.green.shade700;
      style = style.copyWith(
        fontSize: 20,
        color: color,
      );
    } else if (character == 'T') {
      color = Colors.red.shade800;
      style = style.copyWith(
        fontSize: 20,
        color: color,
      );
    }

    return Container(
      width: 44,
      height: 44,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 3),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(character, style: style, softWrap: true, maxLines: 2, textAlign: TextAlign.center,),
    );
  }

  // Widget _category(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.blueGrey.shade500,
  //       borderRadius: BorderRadius.circular(4),
  //     ),
  //     padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
  //     margin: EdgeInsets.symmetric(horizontal: 2),
  //     child: Text(
  //       (category != null) ? category : ' Sem categoria',
  //       style: Theme.of(context).textTheme.caption.copyWith(
  //             fontSize: 12,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.blueGrey.shade100
  //           ),
  //     ),
  //   );
  // }
}
