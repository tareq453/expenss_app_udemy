import '../widget/transaction_item.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty ? Column(children: [
        Text("No Transaction added yet"),
        SizedBox(height: 20,),
        Container(height: 200, child: Image.asset("assets/images/waiting.png",fit: BoxFit.cover,))
      ],): ListView.builder(
        itemBuilder: (context, index) {
          return TransactionItem(_transactions[index]);
        },
        itemCount: _transactions.length,
      ),
    );
  }
}
