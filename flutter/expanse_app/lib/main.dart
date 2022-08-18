import 'dart:io';

import 'package:expanse_app/widgets/chart.dart';
import 'package:expanse_app/widgets/new_transactions.dart';
import 'package:expanse_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Persönliche Ausgaben',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'OpenSans',
        errorColor: Colors.redAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18
          )
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> transactions = [
    /*Transaction(
        id: 't1', title: 'Neue Schuhe', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Kaffee', amount: 1.99, date: DateTime.now()),*/
  ];

  void _addTransaction(String txTitle, double txAmount, DateTime txDate) {
    final transaction = Transaction(id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: txDate
    );

    setState(() {
      transactions.add(transaction);
    });

  }

  void _addNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  var _showChart = false;

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
        title: const Text("Persönliche Ausgaben"),
        actions: [
          IconButton(onPressed: () => _addNewTransaction(context), icon: const Icon(Icons.add))
        ]
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tabelle anzeigen"),
                Switch.adaptive(value: _showChart, onChanged: (val) {
                  setState(() {
                    _showChart = val;
                  });
                }),
              ],
            ),
            _showChart ? Container(height: MediaQuery.of(context).size.height * 0.4 - appBar.preferredSize.height - MediaQuery.of(context).padding.top, child: Chart(_recentTransactions))
            : Container(height: MediaQuery.of(context).size.height * 0.6, child: TransactionList(transactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(child: const Icon(Icons.add), onPressed: () => _addNewTransaction(context),),
    );
  }
}
