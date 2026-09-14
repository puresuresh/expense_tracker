import 'package:flutter/material.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
 const ExpenseApp({super.key});
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExpenseHomePage(),
    );
  }
}
class ExpenseHomePage extends StatelessWidget {
  // final List<String> expenses = ['Groceries', 'Transportation', 'Entertainment'];


  const ExpenseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense App test'),
      ),
     /* body: const Center(
        child: Text('Welcome to the Expense App test!'),
        ), */
     body: Column(children: [ ExpenseCardDetails(title:"Groceries", date:"September 15, 2026", amount:200.00), ExpenseCardDetails(title:"Transportation", date:"September 16, 2026", amount:250.00),ExpenseCardDetails(title:"Entertainment", date:"September 17, 2026", amount:150.00)] )
     );
  }
}

class ExpenseCardDetails extends StatelessWidget {
  final String title;
  final String date;
  final double amount;
  const ExpenseCardDetails({
    required this.title, 
    required this.date, 
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card ( 
     elevation: 5,
     margin: EdgeInsets.all(10),
     child : Padding ( 
       padding:EdgeInsets.all(5),
       child: Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Column(
         mainAxisSize: MainAxisSize.min,
         children:[
         Text(title,style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
         SizedBox(height: 5),
         Text(date,style: TextStyle(fontSize: 14)),
         
         ], 
        ), 
        Container(
         child: Text(amount.toStringAsFixed(2),style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold)),
         decoration: BoxDecoration(
         border: Border.all(color: Colors.black), borderRadius:BorderRadius.circular(10),),
         padding:EdgeInsets.all(10),
         margin: EdgeInsets.all(10),
         ),
       
      
       ],
     ),
    )
        );
  }
}