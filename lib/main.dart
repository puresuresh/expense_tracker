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
  const ExpenseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense App tese'),
      ),
     /* body: const Center(
        child: Text('Welcome to the Expense App test!'),
        ), */
     body: Card ( 
      elevation: 5,
      margin: EdgeInsets.all(10),
      child : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
          mainAxisSize: MainAxisSize.min,
          children:[
          Text("Groceries test",style: TextStyle(fontSize: 16),),
          Text('September 15  2026',style: TextStyle(fontSize: 14)),
          
          ], 
         ), 
         Container(
          child: Text("200.00",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold)),
          decoration: BoxDecoration(
          border: Border.all(color: Colors.black), borderRadius:BorderRadius.circular(10),),
          padding:EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          ),
        
       
        ],
      ),
    ) );
  }
}