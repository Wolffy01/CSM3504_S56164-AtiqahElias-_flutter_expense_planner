import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'T1', title: 'Nike Shoes', amount: 390.00, date: DateTime.now()),
    Transaction(
        id: 'T2',
        title: 'Weekly Groceries',
        amount: 25.50,
        date: DateTime.now()),
    Transaction(
        id: 'T3', title: 'Nike T-Shirt', amount: 149.95, date: DateTime.now()),
    Transaction(
        id: 'T4', title: 'Weekly Meal', amount: 80.8, date: DateTime.now()),
    Transaction(
        id: 'T5', title: 'Weekly life', amount: 23.30, date: DateTime.now()),
  ];

  void _addNewTransaction(String trxTitle, double trxAmount) {
    final newTrx = Transaction(
        id: DateTime.now().toString(),
        title: trxTitle,
        amount: trxAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTrx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        // TransactionList(_userTransactions),
      ],
    );
  }
}
//