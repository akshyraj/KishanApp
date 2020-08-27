import 'package:flutter/material.dart';
import 'package:kishanapp/model/loans.dart';
import 'package:kishanapp/widgets/loan-card.dart';

class LoanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoanPageState();
  }
}
 
class _LoanPageState extends State<LoanPage> {
  final List<Loan> loan = LoanList.getLoan();
 
  Widget _buildNewsList() {
    return ListView.builder(
      itemCount: loan.length,
      itemBuilder: (BuildContext context, int index) {
        return LoanCard(loan: loan[index]);
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNewsList(),
    );
  }
}