import 'package:flutter/material.dart';
import 'package:myexpenses_app/widgets/list_transaction.dart';
import 'package:myexpenses_app/widgets/new_transaction.dart';
import 'package:myexpenses_app/widgets/chart.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.purple,
          accentColor: Colors.purple,
          textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontSize: 20)))
      ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() =>  _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _transactions = [
//    Transaction(
//        id: '1',
//        title: 'makan pagi',
//        amount: 11000,
//        date: DateTime.now()
//    ),
//    Transaction(
//        id: '2',
//        title: 'makan siang',
//        amount: 12000,
//        date: DateTime.now().subtract(Duration(days: 2))
//    ),
//    Transaction(
//        id: '2',
//        title: 'makan siang',
//        amount: 9000,
//        date: DateTime.now().subtract(Duration(days: 3))
//    ),
  ];

  void _addNewTransaction(String title, double amount, DateTime choosenDate) {
    final newTrx = Transaction(
        title: title,
        amount: amount,
        date: choosenDate,
        id: DateTime.now().toString());

    setState(() {
      _transactions.add(newTrx);
    });
  }

  void _startNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, isScrollControlled: true, builder: (_)
    {return NewTransaction(_addNewTransaction);});
  }
  // This widget is the root of your application.
  
  List<Transaction> get _recentTransaction{
    return _transactions.where((trx){
      return trx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _deleteTransaction(String id){
    setState(() {
      _transactions.removeWhere((trx){
        return trx.id ==id;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses Tracker'),
          leading: Icon(Icons.home),
          actions: <Widget>[
            IconButton(
              icon:Icon(Icons.add),
              onPressed: ()=> _startNewTransaction(context),
    )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
//                height: MediaQuery.of(context).size.height*(MediaQuery.of(context).orientation==Orientation.portrait ? 0.3:0.5),
                width: double.infinity,
                child: Chart(_recentTransaction),
              ),
              ListTransaction(_transactions,_deleteTransaction)
            ],
          ),
        ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: ()=> _startNewTransaction(context),
          ),
      );
  }
}
