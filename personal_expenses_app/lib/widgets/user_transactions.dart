import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'new_transactions.dart';
import 'transaction_list.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Grociers",
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransactions(String txTitle, double txtAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txtAmount,
      date: DateTime.now(),
      id: DateTime.now.toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransacions(_addNewTransactions),
        TransactionList(_userTransactions),
      ],
    );
  }
}
