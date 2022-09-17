import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormInput extends StatefulWidget {
  final Function(String, double,DateTime) submitHandler;
  FormInput(this.submitHandler);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: _titleController,
            onSubmitted: (value) => _sumbitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (value) => _sumbitData(),
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(_selectedDate != null
                      ? 'Picked date ${DateFormat.yMd().format(_selectedDate)}'
                      : "No Date Choosen!"),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    "Select Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _sumbitData,
            child: Text("Add Transaction"),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onPrimary: Theme.of(context).textTheme.button?.color),
          )
        ],
      ),
    );
  }

  void _sumbitData() {
    final titleText = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (titleText.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.submitHandler(titleText, amount,_selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    print("Select date");
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2023))
        .then((value) {
      if (value == null) {
        return;
      }
      print('selected date $value');
      setState(() {
        _selectedDate = value;
      });
    });
  }
}
