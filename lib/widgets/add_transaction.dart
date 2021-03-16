import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTx;

  AddTransaction(this.addTx);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate==null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate==null){
        return;

      }
      setState(() {
        _selectedDate =pickedDate;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 5,
      child: Container(
        //height: 300,
        padding: EdgeInsets.all(10),
        //margin: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                                    child: Text(
                      _selectedDate==null
                      ?'No Date Choosen!'
                      :'Picked Date :${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: _datePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.purple,
                child: Text('Add Transaction'),
                textColor: Colors.white,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
