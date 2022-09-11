import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  final Function(String, double) submitHandler;
  FormInput(this.submitHandler);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController,
            onSubmitted: (value) => _sumbitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (value) => _sumbitData(),
          ),
          TextButton(
            onPressed: _sumbitData,
            child: Text("Add Transaction"),
            style: TextButton.styleFrom(primary: Colors.purple),
          )
        ],
      ),
    );
  }

  void _sumbitData() {
    final titleText = titleController.text;
    final amount = double.parse(amountController.text);

    if (titleText.isEmpty || amount <= 0) {
      return;
    }

    widget.submitHandler(titleText, amount);

    Navigator.of(context).pop();
  }
}
