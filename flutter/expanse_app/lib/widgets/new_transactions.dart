import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction(this.addNewTransaction, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titelController = TextEditingController();
  final amountController = TextEditingController();
  String _selectedDate = '';

  void addTrans() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitel = titelController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitel.isEmpty || enteredAmount < 0 || _selectedDate.isEmpty) {
      return;
    }
    widget.addNewTransaction(
        titelController.text, double.parse(amountController.text), DateTime.parse(_selectedDate));

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now()
    ).then((value) {
      if(value == null) {
        return;
      } else {
        setState(() {
          _selectedDate = DateFormat("yyyy-MM-dd").format(value);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Titel'),
            controller: titelController,
            onSubmitted: (_) => addTrans(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => addTrans(),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(child: Text(_selectedDate.isEmpty ? 'Kein Datum gewählt' : _selectedDate)),
                TextButton(
                    onPressed: _presentDatePicker,
                    child: const Text(
                      'Wähle Datum',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          ElevatedButton(
            onPressed: addTrans,
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(
                    color: Theme.of(context).textTheme.button?.color)),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor)),
            child: const Text('Add Transaction'),
          )
        ],
      ),
    ));
  }
}
