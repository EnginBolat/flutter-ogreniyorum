import 'package:flutter/material.dart';

class NewTransacions extends StatefulWidget {
  final Function addTx;

  NewTransacions(this.addTx);

  @override
  State<NewTransacions> createState() => _NewTransacionsState();
}

class _NewTransacionsState extends State<NewTransacions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void submitData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }

      widget.addTx(
        titleController.text,
        double.parse(amountController.text),
      );
    }

    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.orange,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
