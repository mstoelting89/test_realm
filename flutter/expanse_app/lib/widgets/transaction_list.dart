import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function deleteTransaction;

  TransactionList(this._transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height,
      child: _transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Noch keine Transaktionen eingefügt.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 5),
                    child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('\$${_transactions[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(_transactions[index].title, style: Theme.of(context).textTheme.titleLarge,),
                  subtitle: Text(DateFormat.yMMMd().format(_transactions[index].date)),
                  trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => deleteTransaction(_transactions[index].id), color: Theme.of(context).errorColor),
                )
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}