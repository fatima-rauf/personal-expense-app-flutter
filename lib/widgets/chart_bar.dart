import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentOfTotalSpending;

  ChartBar(this.label,this.spendingAmount,this.percentOfTotalSpending);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height:4,
          

        ),
        //main bar
        Container(height: 60,
        width: 10,
        //fill background fractionally
        child: Stack(
          children:[
            Container(
              decoration:BoxDecoration(border: Border.all(color:Colors.grey, width:1.0),
              color:Color.fromRGBO(220, 220, 220, 1),
              borderRadius:BorderRadius.circular(10),
              )
            ),
            FractionallySizedBox(heightFactor:percentOfTotalSpending,
            child:Container(
              decoration:BoxDecoration( color: Theme.of(context).primaryColor,
                borderRadius:BorderRadius.circular(10), )
            ))
          ]
        ),),
        SizedBox(height: 4,),
        Text(label),

      ],
      
    );
  }
}