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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AddExpense(),
    );
  }
}

class ExpenseHomePage extends StatelessWidget {
  // final List<String> expenses = ['Groceries', 'Transportation', 'Entertainment'];

  const ExpenseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense App test')),
      /* body: const Center(
        child: Text('Welcome to the Expense App test!'),
        ), */
      body: Column(
        children: [
          ExpenseCardDetails(
            title: "Groceries",
            date: "September 15, 2026",
            amount: 200.00,
          ),
          ExpenseCardDetails(
            title: "Transportation",
            date: "September 16, 2026",
            amount: 250.00,
          ),
          ExpenseCardDetails(
            title: "Entertainment",
            date: "September 17, 2026",
            amount: 150.00,
          ),
        ],
      ),
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
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(date, style: TextStyle(fontSize: 14)),
              ],
            ),
            Container(
              child: Text(
                amount.toStringAsFixed(2),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate; // non nullable

  final _formKey = GlobalKey<FormState>();

  void showDatepicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }

    print("Selected Date ::$pickedDate");
  }

  void submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final title = _titleController.text;
      final amount = double.parse(_amountController.text);

      print("Title ::: $title,  Amount :: $amount,   Date ::: $_selectedDate");
    }
  }
  void resetForm() {
    _formKey.currentState?.reset();
    _titleController.clear();
    _amountController.clear();
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value == "") {
                  return "Title is required";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              validator: (value) {
                if (value == null || value == "") {
                  return "Amount is required";
                }
                if (double.tryParse(value) == null) {
                  return "Amount is Invalid";
                }
                return null;
              },
            ),
            Text(
              _selectedDate == null
                  ? "No Date"
                  : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
            ),
            TextButton(
              onPressed: () => showDatepicker(),
              child: Text("Choose Date"),
            ),
            Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
            ElevatedButton(
              onPressed: () => submitForm(),
              child: Text("Add Expense"),
              style : ElevatedButton.styleFrom(
                backgroundColor : Colors.indigoAccent,
                foregroundColor : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
              ),
            ),
            SizedBox(width:15.0),
            ElevatedButton(
              onPressed:() => resetForm(),
              child: Text('Reset'),
              style: ElevatedButton.styleFrom(
                backgroundColor : Colors.red,
                foregroundColor : Colors.white,
             
              )
            ),
             ]),
           
          ],
        ),
      ),
    );
  }
}