import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widget/form_input.dart';
import 'widget/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "My Shoes", amount: 25.4, date: DateTime.now()),
    Transaction(id: "t2", title: "My Food", amount: 45.3, date: DateTime.now())
  ];

  
 void _addTransaction(String titleInput, double amountInput) {
  
    setState(() {
      transactions.add(Transaction(
          id: "tNew", title: titleInput, amount: amountInput, date: DateTime.now()));
    });
  }
  
  void _startNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: ((_) {
            return FormInput(_addTransaction);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense App"),
      actions: [
        IconButton(onPressed: () {
          _startNewTransaction(context);
        }, icon: Icon(Icons.add))
      ],),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Charts!!"),
                elevation: 10,
              ),
            ),
            TransactionList(transactions)
          ],
        ),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: (() {
        _startNewTransaction(context);
      }), child: Icon(Icons.add),),
    );
  }
}
