import 'package:flutter/material.dart';
import './models/transaction.dart';
import './components/transactions_list.dart';
import './components/transactions_field.dart';

main() => runApp(AppGestao());

class AppGestao extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(home: HomePage())
    );
  }
}

class HomePage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Despesas Pessoais'),   
        ),
        body: Column(
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
            
            

            
          ],
        ),
        );
  }
}