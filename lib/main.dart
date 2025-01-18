import 'package:flutter/material.dart';
import './models/transaction.dart';

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

  final _transactions = [


    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.00,
      date: DateTime.now()
    ),

    Transaction(
      id: 't2',
      title: 'Nova Skin Valorant',
      value: 211.00,
      date: DateTime.now()
    ),
    

  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Despesas Pessoais'),   
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Column(
              children: _transactions.map((tr){
                  return Card(
                    child: Row(children: [

                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                      ),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 2
                        )
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tr.value.toString()
                      ),

                    ),

                    Column(
                      children: [
                        Text(tr.title),
                        Text(tr.date.toString()),
                      ],
                    )




                    ],
                    ),
                  );
              }).toList(),
            ),
          ],
        ),
        );
  }
}