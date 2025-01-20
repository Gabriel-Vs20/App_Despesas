import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:intl/intl.dart';

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
                        'R\$ ' + tr.value.toStringAsFixed(2),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 255, 8, 0)
                        ),
                      ),
                    
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                        ),
                        Text(DateFormat('d/MMM/y').format(tr.date),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 137, 128, 128)
                        ),
                        ),
                      ],
                    ),
                    ],
                    ),
                  );
              }).toList(),
            ),
            Card(
              elevation: 5,
               child: Padding(
                 padding: const EdgeInsets.all(10),
                 child: Column(
                 children: [
                 
                    TextField(
                      decoration: InputDecoration(
                      labelText: 'Titulo',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                      labelText: 'Titulo',
                      ),
                    ),
                 
                 ],
                               ),
               ),
            ),
          ],
        ),
        );
  }
}