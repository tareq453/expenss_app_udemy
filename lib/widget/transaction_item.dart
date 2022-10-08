import 'dart:math';

import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function(Transaction) deleteHandler;
  const TransactionItem({Key? key,required this.transaction,required this.deleteHandler}) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
Color? _bgColor;

@override
  void initState() {
    List<Color> colorList = [
      Colors.red,
      Colors.white,
      Colors.pink,
      Colors.yellow
    ];
    _bgColor = colorList[Random().nextInt(4)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
                child: Text("\$${widget.transaction.amount.toStringAsFixed(2)}")),
          ),
        ),
        title: Text(widget.transaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: _mediaQuery.size.width > 450
            ? TextButton.icon(
                onPressed: _deleteTransaction,
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
                style: TextButton.styleFrom(primary: Theme.of(context).errorColor),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: _deleteTransaction,
              ),
      ),
    );
  }

  void _deleteTransaction() {
    widget.deleteHandler(widget.transaction);
  }
}
