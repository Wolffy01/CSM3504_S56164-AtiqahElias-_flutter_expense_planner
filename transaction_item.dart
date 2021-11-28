import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final deleteTrx;

  const TransactionItem(
    {Key? key, required this.transaction, required this.deleteTrx}
  )
  : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\RM${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ),
            ),
        ),
        title: Text( 
          transaction.title,
          style: Theme.of(context).textTheme.bodyText1
          ),
          subtitle: Text(
            DateFormat.yMd().format(transaction.date),
            style: Theme.of(context).textTheme.bodyText2,
          ),
          trailing: MediaQuery.of(context).size.width > 360 
          ? FlatButton.icon(
            onPressed: () => deleteTrx(transaction.id),
            icon: Icon(Icons.delete), 
            label: const Text('Delete'),
            color: Theme.of(context).errorColor,
            )
          : IconButton(
            onPressed: () => deleteTrx(transaction.id),
            icon: Icon(Icons.delete),
            ),
        ),
      );
  }
}