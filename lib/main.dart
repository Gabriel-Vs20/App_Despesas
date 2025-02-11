import 'package:app2flutter/components/chart.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './components/transactions_list.dart';
import './components/transactions_field.dart';
import 'dart:math';

main() => runApp(AppGestao());

class AppGestao extends StatelessWidget {
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        fontFamily: 'Lato',
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.blue,
          secondary: Colors.amber,
          tertiary: Colors.black,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transactions = [];

  bool showChart = false;

  List<Transaction> get _recentTransactions {
    return transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      transactions.add(newTransaction);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionsField(_addTransaction);
        });
  }

  _deleteTransaction (String id){
    setState(() {

      transactions.removeWhere((tr){
        return tr.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    bool isLandScape = mediaQuery.orientation == Orientation.landscape;


    final appBar = AppBar(
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add)),
          if(isLandScape)
          IconButton(onPressed: (){
          setState(() {
            showChart = !showChart;
          });
        },
        icon: Icon(showChart ? Icons.list : Icons.add_chart)),
        ],
        title: Text('Despesas Pessoais',
        style: TextStyle(
          fontSize: 10 * mediaQuery.textScaler.scale(1),
        ),
        ),
      );

      final availableHeight = mediaQuery.size.height
       - appBar.preferredSize.height
       - mediaQuery.padding.top;


    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                if(showChart || !isLandScape)
                Container(
                  height: availableHeight * (isLandScape ? 0.7 : 0.3),
                  child: Chart(_recentTransactions)),
                if(!showChart || !isLandScape)
                  Container(
                  height: availableHeight * 0.65,
                  child: TransactionsList(transactions, _deleteTransaction)),
              ],
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
