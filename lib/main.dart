import 'package:flutter/material.dart';
import './models/transaction.dart';
import './components/transactions_list.dart';
import './components/transactions_field.dart';
import 'dart:math';

main() => runApp(AppGestao());

class AppGestao extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(home: HomePage())
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final transactions = [


    Transaction(
      id: 't1',
      title: 'Sei lá',
      value: 310.00,
      date: DateTime.now()
    ),
  ];

  _addTransaction (String title, double value){
    final newTransaction = Transaction(
    id:Random().nextDouble().toString(), 
    title: title,
    value: value,
    date: DateTime.now());

    setState(() {
      transactions.add(newTransaction);
    });
  }

    
    _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(context: context,
     builder: (_){
      return TransactionsField(_addTransaction);
     }
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => _openTransactionFormModal(context), 
          icon: Icon(Icons.add)),
        ],
        backgroundColor: Colors.red, 
        title: Text('Despesas Pessoais'),   
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              Container(
                child: Card(
                  color: Colors.red,
                  elevation: 5,
                  child: Center(
                    child: Text('Gráfico'),
                  )
                ),
              ),

              TransactionsList(transactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }
}