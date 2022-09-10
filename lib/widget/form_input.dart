import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function(String, String) submitHandler;
  FormInput(this.submitHandler);

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
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
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


  void _sumbitData(){
    submitHandler(titleController.text,amountController.text);
  }
}
