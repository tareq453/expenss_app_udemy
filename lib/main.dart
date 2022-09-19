import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transaction.dart';
import 'widget/form_input.dart';
import 'widget/transaction_list.dart';
import 'widget/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
          primarySwatch: Colors.brown,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              button: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  bool _showChart = true;

  List<Transaction> get _recenctTransaction {
    return _transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(
      String titleInput, double amountInput, DateTime selectedDate) {
    setState(() {
      _transactions.add(Transaction(
          id: DateTime.now().toString(),
          title: titleInput,
          amount: amountInput,
          date: selectedDate));
    });
  }

  void _startNewTransaction(BuildContext context) {
    print("start new transaction");
    showModalBottomSheet(
        context: context,
        builder: ((_) {
          return FormInput(_addTransaction);
        }));
  }

  void _deleteTransaction(Transaction transaction) {
    print('transaction $transaction');
    if (_transactions.contains(transaction)) {
      setState(() {
        _transactions.removeWhere((element) => element.id == transaction.id);
        // transactions.remove(transaction);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text("Expense App"),
      actions: [
        IconButton(
            onPressed: () {
              _startNewTransaction(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    var deviceHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Text("Show chart!"),
              Switch(value: _showChart, onChanged: ((value) {
                setState(() {
                  _showChart = !_showChart;
                });
              }))
            ],),
            _showChart ?
            Container(
                height: deviceHeight * 0.3, child: Chart(_recenctTransaction))
                :
            Container(
                height: deviceHeight * 0.5,
                child: TransactionList(_transactions, _deleteTransaction))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _startNewTransaction(context);
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}
