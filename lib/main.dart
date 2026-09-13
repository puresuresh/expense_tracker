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
        title: const Text('Expense App'),
      ),
      body: const Center(
        child: Text('Welcome to the Expense App!'),
      ),
    );
  }
}