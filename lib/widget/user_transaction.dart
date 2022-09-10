import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'form_input.dart';
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "My Shoes", amount: 25.4, date: DateTime.now()),
    Transaction(id: "t2", title: "My Food", amount: 45.3, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [FormInput(_addTransaction), TransactionList(transactions)],
    );
  }

  void _addTransaction(String titleInput, double amountInput) {
    setState(() {
      transactions.add(Transaction(
          id: "tNew", title: titleInput, amount: amountInput, date: DateTime.now()));
    });
  }
}
