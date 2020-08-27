
import 'package:flutter/material.dart';
import 'package:kishanapp/model/loans.dart';
 
class LoanCard extends StatelessWidget {
  final Loan loan;
 
  LoanCard({this.loan});
 
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(loan.imageUrl, fit: BoxFit.cover, width: 100.0, height: double.infinity,),
            title: Text(loan.title,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),),
            subtitle: Text(loan.date,style:TextStyle(fontSize: 11.0,),textAlign: TextAlign.right,),
          )
        ],
      ),
    );
  }
}