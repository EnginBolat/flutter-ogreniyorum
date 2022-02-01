import 'package:flutter/material.dart';

import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Personal Expenses",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: "QuickSand",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: "QuickSand",
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
                  button: const TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                headline6: const TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
              .headline6,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //    id: "t1",
    //    title: "New Shoes",
    //    amount: 69.99,
    //    date: DateTime.now(),
    //  ),
    //  Transaction(
    //    id: "t2",
    //    title: "Grociers",
    //    amount: 16.53,
    //    date: DateTime.now(),
    //  ),
  ];

  List<Transaction> get _recentTransactions{
    return _userTransactions.where((tx){
      return tx.date.isAfter(
         DateTime.now().subtract(const Duration(days:7))
      );
    }).toList();
  }

  void _addNewTransactions(String txTitle, double txtAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txtAmount,
      date: chosenDate,
      id: DateTime.now.toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransacions(_addNewTransactions);
        });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id==id);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        foregroundColor: Colors.white,
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
