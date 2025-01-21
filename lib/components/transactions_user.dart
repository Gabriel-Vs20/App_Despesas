import 'package:flutter/material.dart';
import './transactions_field.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

class TransactionsUser extends StatefulWidget {

  @override
  _TransactionsUserState createState() => _TransactionsUserState();
}

class _TransactionsUserState extends State<TransactionsUser> {

  
  final transactions = [


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
    return Column(
      children: [

        TransactionsList(transactions)

      ],
    );
  }
}