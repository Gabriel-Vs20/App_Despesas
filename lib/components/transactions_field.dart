import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsField extends StatefulWidget {

  final void Function( String, double, DateTime) _addTransaction;

  TransactionsField(this._addTransaction);

  @override
  State<TransactionsField> createState() => _TransactionsFieldState();
}

class _TransactionsFieldState extends State<TransactionsField> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();

  DateTime _selectedDate = DateTime.now();


  _showDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now()
      ).then((pickedDate){

      if(pickedDate == null){
        return;
      }
      setState(() {
      _selectedDate = pickedDate;
      });

      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
                elevation: 5,
                 child: Padding(
                   padding: EdgeInsets.only(
                    top: 10,
                    right: 10,
                    left: 10,
                    bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
                   ),
                   child: Column(
                   children: [
                   
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                        labelText: 'Titulo',
                        
                        ),
                      ),
                      TextField(
                        controller: _valueController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                        labelText: 'Valor R\$',
                        ),
                      ),
                    Container(
                      height: 70,
                      child: Row(children: [
                      
                        Expanded(
                          child: Text(
                            _selectedDate == null ? "Nenhuma data selecionada"
                            : DateFormat('dd/MM/y').format(_selectedDate)),
                        ),
                        ElevatedButton(onPressed: _showDatePicker, child: Text("Selecionar data",
                        style: TextStyle(
                          fontSize: 20
                        ),))
                      
                      ],
                      ),
                    ),
      
                   Row(
                     children: [
                       Card(
                        elevation: 6,
                         child: ElevatedButton(
                                         
                          style: ButtonStyle(
                            foregroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 255, 255, 255))
                                   
                          ),
                          
                          onPressed: (){
                         
                          final title = _titleController.text;
                          final value = double.tryParse(_valueController.text) ?? 0.0;
                         
                          widget._addTransaction(title, value, _selectedDate);
                          Navigator.pop(context);
                         
                         },
                         child: Text(
                          '+ Transação'
                         ),
                         ),
                       ),
                     ],
                   ),
                   ],
                                 ),
                 ),
              ),
    );
  }
}