import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;
  final Function(Transaction) deleteHandler;
  TransactionItem(this._transaction, this.deleteHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
                child: Text("\$${_transaction.amount.toStringAsFixed(2)}")),
          ),
        ),
        title: Text(_transaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
          DateFormat.yMMMd().format(_transaction.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: _deleteTransaction,
        ),
      ),
    );
  }

  void _deleteTransaction(){
    deleteHandler(_transaction);
  }
}
