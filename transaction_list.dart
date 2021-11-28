import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/transaction_item.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTrx;

  TransactionList(this.transactions, this.deleteTrx);


  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet..!',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox( //add const
                  height: 20,
                ),
                Container(
                  //height: 200,
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transaction: transactions[index], deleteTrx: deleteTrx
              );
              },
            //  itemCount: transactions.length,
          );
  }
}
